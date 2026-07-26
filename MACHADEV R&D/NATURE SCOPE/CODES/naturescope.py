"""
nature_scope_pipeline.py
Pipeline to extract 'nature scope' from a research / R&D video.
Outputs: JSON with transcript, topics, summary, detected objects/counts, scope labels.
"""
import os, json, math, tempfile
from pathlib import Path
import ffmpeg
import cv2
import numpy as np
from collections import Counter
# --- Transcription (Whisper) ---
import whisper
# --- YOLOv8 (Ultralytics) ---
from ultralytics import YOLO
# --- Topic modeling & embeddings ---
from bertopic import BERTopic
from sentence_transformers import SentenceTransformer
# --- Summarization ---
from transformers import pipeline
# ---------- Utilities ----------
def extract_audio(video_path, out_audio_path):
    # Use ffmpeg-python to extract audio (wav)
    (
        ffmpeg
        .input(video_path)
        .output(out_audio_path, ac=1, ar='16k', format='wav', loglevel='error')
        .overwrite_output()
        .run()
    )
    return out_audio_path
def sample_frames(video_path, fps_sample=0.5, max_frames=200):
    """
    Sample frames at fps_sample frames per second.
    Returns list of BGR frames (numpy arrays).
    """
    vid = cv2.VideoCapture(str(video_path))
    if not vid.isOpened():
        raise RuntimeError("Cannot open video: " + str(video_path))
    video_fps = vid.get(cv2.CAP_PROP_FPS) or 30.0
    total_frames = int(vid.get(cv2.CAP_PROP_FRAME_COUNT) or 0)
    duration = total_frames / video_fps if video_fps else 0
    step = max(1, int(video_fps / fps_sample))
    frames = []
    idx = 0
    while True:
        ret, frame = vid.read()
        if not ret:
            break
        if idx % step == 0:
            frames.append(frame)
            if len(frames) >= max_frames:
                break
        idx += 1
    vid.release()
    return frames
# ---------- AI modules ----------
def transcribe_whisper(audio_path, model_size="small"):
    """
    Transcribe audio using local Whisper model.
    model_size options: tiny, base, small, medium, large (use appropriate hardware)
    """
    model = whisper.load_model(model_size)
    result = model.transcribe(str(audio_path))
    # result contains 'text' and 'segments' with timestamps
    return result

def detect_objects_yolo(frames, yolo_model="yolov8n.pt", conf=0.35):
    """
    Run YOLOv8 detector on list of frames.
    Returns aggregated counts and example detections.
    """
    model = YOLO(yolo_model)  # will download if name available (e.g., "yolov8n")
    counts = Counter()
    detections_examples = []
    for i, frame in enumerate(frames):
        # Ultralytics accepts numpy arrays in BGR
        out = model.predict(frame, imgsz=640, conf=conf, verbose=False)  # returns list of Results
        # out[0].boxes.xyxy, out[0].boxes.conf, out[0].boxes.cls
        res = out[0]
        if res.boxes is None:
            continue
        names = [model.names[int(c)] for c in res.boxes.cls.tolist()]
        counts.update(names)
        # Optionally store example detection metadata
        if i < 5 and names:
            detections_examples.append({"frame_index": i, "objects": names})
    return {"counts": dict(counts), "examples": detections_examples}

def topic_model_transcript(transcript_text, embedding_model_name="all-MiniLM-L6-v2", nr_topics=None):
    """
    Use BERTopic to extract topics from transcript split into sentences/segments.
    """
    # Simple split into sentences (could use better sentence splitter)
    import re
    # split on periods; keep segments reasonably sized
    raw_segments = [s.strip() for s in re.split(r'(?<=[\.\?\!])\s+', transcript_text) if len(s.strip())>20]
    if not raw_segments:
        raw_segments = [transcript_text]
    # embeddings
    embed_model = SentenceTransformer(embedding_model_name)
    topic_model = BERTopic(embedding_model_model=embed_model, calculate_probabilities=False)
    topics, probs = topic_model.fit_transform(raw_segments)
    # Get top topic words and representative docs
    top_topics = topic_model.get_topic_info().head(10).to_dict(orient='records')
    # also get each topic's top words
    topic_details = {}
    for t in set(topics):
        if t == -1:
            continue
        words = topic_model.get_topic(t)
        topic_details[t] = words
    return {"segments": raw_segments, "topics": topic_details, "topic_info": top_topics}
def summarize_text(text, model_name="facebook/bart-large-cnn", max_length=120):
    summarizer = pipeline("summarization", model=model_name, truncation=True)
    # Transformers summarizer has input length limits; chunk if necessary
    # Simple chunking by sentences
    import re
    sentences = re.split(r'(?<=[\.\?\!])\s+', text)
    chunks = []
    current = ""
    for s in sentences:
        if len((current + " " + s)) < 1000:
            current = (current + " " + s).strip()
        else:
            chunks.append(current)
            current = s
    if current:
        chunks.append(current)
    summarized_parts = []
    for c in chunks:
        out = summarizer(c, max_length=max_length, min_length=30, do_sample=False)
        summarized_parts.append(out[0]['summary_text'])
    final_summary = " ".join(summarized_parts)
    return final_summary
# ---------- Assembly ----------
def build_nature_scope(video_path, tmp_dir=None):
    tmp_dir = tmp_dir or tempfile.mkdtemp()
    video_path = Path(video_path)
    audio_path = Path(tmp_dir) / (video_path.stem + "_audio.wav")
    # 1) extract audio
    extract_audio(video_path, str(audio_path))
    # 2) transcribe (whisper)
    trans_result = transcribe_whisper(str(audio_path), model_size="small")  # change size if needed
    transcript = trans_result.get("text", "")
    # 3) sample frames
    frames = sample_frames(video_path, fps_sample=0.5, max_frames=150)
    # 4) detect objects
    # Use a minimal yolov8 model or custom model trained for wildlife if available
    yolo_out = detect_objects_yolo(frames, yolo_model="yolov8n.pt", conf=0.35)
    # 5) topics
    topic_out = topic_model_transcript(transcript)
    # 6) summarization
    summary = summarize_text(transcript)
    # 7) propose nature-scope labels heuristically
    scope_labels = []
    # heuristics: check for keywords from topics and detections
    nature_keywords = ["biodiversity","species","habitat","conservation","forest","wetland","air quality","pollution","remote sensing","satellite","camera trap","population","ecology","climate"]
    for kw in nature_keywords:
        if kw in transcript.lower() or any(kw in t for t in topic_out.get("topic_info", [])):
            scope_labels.append(kw)
    # also add labels from detected objects
    for obj, count in yolo_out["counts"].items():
        low = obj.lower()
        if low in ["bird","dog","cat","person","sheep","cow","horse","elephant","bear","zebra","giraffe","boat","tree","plant","dog"]:
            scope_labels.append(low)
    scope_labels = list(dict.fromkeys(scope_labels))  # deduplicate maintain order
    result = {
        "transcript": transcript,
        "summary": summary,
        "topics": topic_out["topic_info"],
        "topic_words": topic_out["topics"],
        "detections": yolo_out,
        "suggested_scope_labels": scope_labels
    }
    return result
# ---------- Example usage ----------
if __name__ == "__main__":
    import argparse
    p = argparse.ArgumentParser()
    p.add_argument("video", help="Path to input video (mp4/mkv/avi)")
    p.add_argument("--out", help="JSON output file", default="nature_scope_output.json")
    args = p.parse_args()
    print("Processing:", args.video)
    out = build_nature_scope(args.video)
    with open(args.out, "w", encoding="utf8") as f:
        json.dump(out, f, indent=2, ensure_ascii=False)
    print("Saved output to", args.out)
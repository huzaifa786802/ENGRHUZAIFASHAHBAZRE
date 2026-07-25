#TASK 2: Emotion Recognition from Speech
#Objective: Recognize human emotions (e.g., happy, angry, sad) from speech audio.
#Approach: Apply deep learning and speech signal processing techniques.
#Key Features:
#Extract features like MFCCs (Mel-Frequency Cepstral Coefficients).
#Use models like CNN, RNN, or LSTM.
#Datasets: RAVDESS, TESS, or EMO-DB.
#TASK 2: Emotion Recognition from Speech
#Objective: Recognize human emotions (e.g., happy, angry, sad) from speech audio.
#Approach: Apply deep learning and speech signal processing techniques.
#Key Features:
#Extract features like MFCCs (Mel-Frequency Cepstral Coefficients).
#Use models like CNN, RNN, or LSTM.
#Datasets: RAVDESS, TESS, or EMO-DB.
# ==========================================
# Emotion Recognition from Speech (No DL)
# ==========================================

import os
import numpy as np
import librosa

from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder, StandardScaler
from sklearn.svm import SVC
from sklearn.metrics import accuracy_score, classification_report

# ------------------------------------------
# 1. MFCC Feature Extraction
# ------------------------------------------
def extract_mfcc(file_path, n_mfcc=40):
    """Extract MFCC features from an audio file."""
    audio, sr = librosa.load(file_path, duration=3, offset=0.5)
    mfcc = librosa.feature.mfcc(y=audio, sr=sr, n_mfcc=n_mfcc)
    mfcc = np.mean(mfcc.T, axis=0)
    return mfcc


# ------------------------------------------
# 2. Load Dataset
# Folder structure:
# dataset/happy/
# dataset/sad/
# dataset/angry/
# ------------------------------------------
print("=" * 50)
print("Emotion Recognition from Speech")
print("=" * 50)

dataset_path = "dataset"

# Check if dataset directory exists
if not os.path.exists(dataset_path):
    print(f"ERROR: Dataset directory '{dataset_path}' not found!")
    print("Please create a 'dataset' folder with subfolders for each emotion.")
    print("Example structure:")
    print("  dataset/happy/")
    print("  dataset/sad/")
    print("  dataset/angry/")
    exit(1)

print(f"\nLoading dataset from: {dataset_path}")
print("-" * 50)

X = []
y = []
loaded_count = 0
error_count = 0

# Audio file extensions to check
audio_extensions = {'.wav', '.mp3', '.flac', '.m4a', '.ogg'}

for emotion in os.listdir(dataset_path):
    emotion_path = os.path.join(dataset_path, emotion)
    if not os.path.isdir(emotion_path):
        continue

    print(f"Processing emotion: {emotion}")
    emotion_count = 0
    
    for file in os.listdir(emotion_path):
        file_path = os.path.join(emotion_path, file)
        
        # Check if it's an audio file
        _, ext = os.path.splitext(file)
        if ext.lower() not in audio_extensions:
            continue
        
        try:
            features = extract_mfcc(file_path)
            X.append(features)
            y.append(emotion)
            loaded_count += 1
            emotion_count += 1
        except Exception as e:
            print(f"  Warning: Could not process {file}: {str(e)}")
            error_count += 1
    
    print(f"  -> Loaded {emotion_count} files for {emotion}")

print("-" * 50)
print(f"Total files loaded: {loaded_count}")
if error_count > 0:
    print(f"Files with errors: {error_count}")

# Check if we have data
if len(X) == 0:
    print("\nERROR: No audio files were loaded!")
    print("Please check that:")
    print("  1. The 'dataset' folder exists")
    print("  2. It contains subfolders with emotion names (e.g., 'happy', 'sad', 'angry')")
    print("  3. Each subfolder contains audio files (.wav, .mp3, etc.)")
    exit(1)

X = np.array(X)
y = np.array(y)

print(f"\nDataset shape: {X.shape}")
print(f"Number of emotions: {len(np.unique(y))}")

# ------------------------------------------
# 3. Encode Labels & Normalize Features
# ------------------------------------------
print("\n" + "=" * 50)
print("Preprocessing Data")
print("=" * 50)

label_encoder = LabelEncoder()
y_encoded = label_encoder.fit_transform(y)

print(f"Emotions found: {list(label_encoder.classes_)}")
print(f"Label mapping: {dict(zip(label_encoder.classes_, range(len(label_encoder.classes_))))}")

scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

X_train, X_test, y_train, y_test = train_test_split(
    X_scaled, y_encoded, test_size=0.2, random_state=42
)

print(f"\nTraining samples: {len(X_train)}")
print(f"Test samples: {len(X_test)}")

# ------------------------------------------
# 4. Train SVM Classifier
# ------------------------------------------
print("\n" + "=" * 50)
print("Training SVM Classifier")
print("=" * 50)
print("Training in progress...", end="", flush=True)

svm_model = SVC(kernel='rbf', C=10, gamma='scale', random_state=42)
svm_model.fit(X_train, y_train)

print(" Done!")

# ------------------------------------------
# 5. Evaluate Model
# ------------------------------------------
print("\n" + "=" * 50)
print("Model Evaluation")
print("=" * 50)

y_pred = svm_model.predict(X_test)

accuracy = accuracy_score(y_test, y_pred)
print(f"\nTest Accuracy: {accuracy * 100:.2f}%")

print("\nClassification Report:")
print("-" * 50)
print(classification_report(
    y_test,
    y_pred,
    target_names=label_encoder.classes_
))

# ------------------------------------------
# 6. Predict Emotion (New Audio)
# ------------------------------------------
def predict_emotion(audio_file):
    """Predict emotion from an audio file."""
    if not os.path.exists(audio_file):
        raise FileNotFoundError(f"Audio file not found: {audio_file}")
    
    mfcc = extract_mfcc(audio_file)
    mfcc_scaled = scaler.transform([mfcc])
    prediction = svm_model.predict(mfcc_scaled)
    emotion = label_encoder.inverse_transform(prediction)
    return emotion[0]


# Example prediction - check available audio files
print("\n" + "=" * 50)
print("Testing Prediction on Available Audio Files")
print("=" * 50)

# Check for available .wav files in current directory
test_files = [f for f in os.listdir('.') if f.endswith('.wav') and os.path.isfile(f)]

if test_files:
    print(f"\nFound {len(test_files)} .wav file(s) in current directory:")
    for i, test_file in enumerate(test_files[:5], 1):  # Limit to first 5
        print(f"  {i}. {test_file}")
    
    print("\nPredicting emotions:")
    print("-" * 50)
    for test_file in test_files[:3]:  # Test first 3 files
        try:
            emotion = predict_emotion(test_file)
            print(f"{test_file:30s} -> {emotion}")
        except Exception as e:
            print(f"{test_file:30s} -> Error: {str(e)}")
else:
    print("\nNo .wav files found in current directory to test.")
    print("To test prediction, use:")
    print("  emotion = predict_emotion('your_audio_file.wav')")
    print("  print(f'Predicted Emotion: {emotion}')")

print("\n" + "=" * 50)
print("Program completed successfully!")
print("=" * 50)

import openai
from config import OPENAI_API_KEY, MODEL_NAME
from youtube_service import fetch_videos

openai.api_key = OPENAI_API_KEY

def generate_response(user_query):
    videos = fetch_videos()
    context = "\n".join([f"{v['title']} -> {v['url']}" for v in videos])

    prompt = f'''
You are the official AI assistant for the YouTube channel "NextGen CE".
The channel focuses on Computer Engineering, Embedded Systems, and IoT.

User Question:
{user_query}

Relevant Channel Videos:
{context}

Respond academically, clearly, and practically.
'''

    response = openai.ChatCompletion.create(
        model=MODEL_NAME,
        messages=[{"role": "user", "content": prompt}],
        temperature=0.5
    )

    return response["choices"][0]["message"]["content"]
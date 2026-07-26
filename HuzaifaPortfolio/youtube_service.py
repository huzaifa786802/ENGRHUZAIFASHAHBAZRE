from googleapiclient.discovery import build
from config import YOUTUBE_API_KEY, CHANNEL_ID

youtube = build("youtube", "v3", developerKey=YOUTUBE_API_KEY)

def fetch_videos(max_results=15):
    request = youtube.search().list(
        part="snippet",
        channelId=CHANNEL_ID,
        maxResults=max_results,
        order="date"
    )
    response = request.execute()

    videos = []
    for item in response.get("items", []):
        if item["id"]["kind"] == "youtube#video":
            videos.append({
                "title": item["snippet"]["title"],
                "description": item["snippet"]["description"],
                "url": f"https://www.youtube.com/watch?v={item['id']['videoId']}"
            })
    return videos
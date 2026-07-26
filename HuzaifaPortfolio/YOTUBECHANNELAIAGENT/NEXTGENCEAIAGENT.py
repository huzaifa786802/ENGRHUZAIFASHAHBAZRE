"""
NextGen CE YouTube Channel AI Agent
An intelligent agent that analyzes and interacts with the NextGen CE YouTube channel
using YouTube Data API v3 and OpenAI GPT.
"""

from typing import Dict, List
from googleapiclient.discovery import build
from googleapiclient.errors import HttpError
import openai

# API Keys Configuration
YOUTUBE_API_KEY = "AIzaSyCqKi1wiMaLPxvvdv7sGWsHVuqEH_AzJ0M"
OPENAI_API_KEY = "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"
CHANNEL_ID = "UCILHV3EyT5iOLCw1c8LLY1A"

# Note: YouTube and OpenAI clients are initialized in the class


class YouTubeChannelAIAgent:
    """AI Agent for analyzing NextGen CE YouTube Channel"""
    
    def __init__(self, channel_id: str, youtube_api_key: str, openai_api_key: str):
        self.channel_id = channel_id
        self.youtube = build('youtube', 'v3', developerKey=youtube_api_key)
        self.client = openai.OpenAI(api_key=openai_api_key)
        
    def get_channel_info(self) -> Dict:
        """Fetch basic channel information"""
        try:
            request = self.youtube.channels().list(
                part='snippet,statistics,contentDetails',
                id=self.channel_id
            )
            response = request.execute()
            
            if response['items']:
                channel = response['items'][0]
                return {
                    'title': channel['snippet']['title'],
                    'description': channel['snippet']['description'],
                    'subscriber_count': channel['statistics'].get('subscriberCount', '0'),
                    'video_count': channel['statistics'].get('videoCount', '0'),
                    'view_count': channel['statistics'].get('viewCount', '0'),
                    'custom_url': channel['snippet'].get('customUrl', 'N/A'),
                    'published_at': channel['snippet']['publishedAt'],
                    'thumbnail': channel['snippet']['thumbnails']['high']['url']
                }
            return {}
        except HttpError as e:
            print(f"An error occurred: {e}")
            return {}
    
    def get_recent_videos(self, max_results: int = 10) -> List[Dict]:
        """Get recent videos from the channel"""
        try:
            request = self.youtube.search().list(
                part='snippet',
                channelId=self.channel_id,
                maxResults=max_results,
                order='date',
                type='video'
            )
            response = request.execute()
            
            videos = []
            for item in response['items']:
                video_id = item['id']['videoId']
                video_details = self.get_video_details(video_id)
                videos.append({
                    'video_id': video_id,
                    'title': item['snippet']['title'],
                    'description': item['snippet']['description'][:200] + '...' if len(item['snippet']['description']) > 200 else item['snippet']['description'],
                    'published_at': item['snippet']['publishedAt'],
                    'thumbnail': item['snippet']['thumbnails']['high']['url'],
                    'url': f"https://www.youtube.com/watch?v={video_id}",
                    **video_details
                })
            return videos
        except HttpError as e:
            print(f"An error occurred: {e}")
            return []
    
    def get_video_details(self, video_id: str) -> Dict:
        """Get detailed statistics for a specific video"""
        try:
            request = self.youtube.videos().list(
                part='statistics,contentDetails,snippet',
                id=video_id
            )
            response = request.execute()
            
            if response['items']:
                video = response['items'][0]
                return {
                    'views': video['statistics'].get('viewCount', '0'),
                    'likes': video['statistics'].get('likeCount', '0'),
                    'comments': video['statistics'].get('commentCount', '0'),
                    'duration': video['contentDetails']['duration']
                }
            return {}
        except HttpError as e:
            print(f"An error occurred: {e}")
            return {}
    
    def get_video_comments(self, video_id: str, max_results: int = 20) -> List[Dict]:
        """Get comments from a specific video"""
        try:
            request = self.youtube.commentThreads().list(
                part='snippet',
                videoId=video_id,
                maxResults=max_results,
                order='relevance'
            )
            response = request.execute()
            
            comments = []
            for item in response['items']:
                comment = item['snippet']['topLevelComment']['snippet']
                comments.append({
                    'author': comment['authorDisplayName'],
                    'text': comment['textDisplay'],
                    'likes': comment['likeCount'],
                    'published_at': comment['publishedAt'],
                    'updated_at': comment['updatedAt']
                })
            return comments
        except HttpError as e:
            print(f"An error occurred: {e}")
            return []
    
    def get_channel_statistics_summary(self) -> str:
        """Get a comprehensive summary of channel statistics"""
        channel_info = self.get_channel_info()
        recent_videos = self.get_recent_videos(5)
        
        summary = f"""
NextGen CE YouTube Channel Statistics:
=====================================
Channel Name: {channel_info.get('title', 'N/A')}
Subscribers: {channel_info.get('subscriber_count', '0'):,}
Total Videos: {channel_info.get('video_count', '0'):,}
Total Views: {channel_info.get('view_count', '0'):,}
Channel Created: {channel_info.get('published_at', 'N/A')}

Recent Videos ({len(recent_videos)}):
"""
        for i, video in enumerate(recent_videos, 1):
            summary += f"""
{i}. {video['title']}
   Views: {video.get('views', '0'):,} | Likes: {video.get('likes', '0'):,} | Comments: {video.get('comments', '0'):,}
   URL: {video['url']}
"""
        return summary
    
    def analyze_with_ai(self, prompt: str, context: str = "") -> str:
        """Use OpenAI to analyze channel data"""
        try:
            full_prompt = f"""You are an AI assistant analyzing the NextGen CE YouTube channel.
            
{context}

User Question: {prompt}

Please provide a helpful, detailed response based on the channel data provided."""
            
            response = self.client.chat.completions.create(
                model="gpt-4",
                messages=[
                    {"role": "system", "content": "You are an expert YouTube channel analyst helping with the NextGen CE channel."},
                    {"role": "user", "content": full_prompt}
                ],
                max_tokens=1000,
                temperature=0.7
            )
            
            return response.choices[0].message.content
        except Exception as e:
            return f"Error analyzing with AI: {str(e)}"
    
    def generate_content_suggestions(self) -> str:
        """Generate content suggestions based on channel analysis"""
        channel_info = self.get_channel_info()
        recent_videos = self.get_recent_videos(10)
        
        video_titles = [video['title'] for video in recent_videos]
        video_data = "\n".join([f"- {title} (Views: {video['views']}, Likes: {video['likes']})" 
                               for video, title in zip(recent_videos, video_titles)])
        
        context = f"""
Channel Information:
- Channel Name: {channel_info.get('title')}
- Subscribers: {channel_info.get('subscriber_count')}
- Total Videos: {channel_info.get('video_count')}

Recent Videos:
{video_data}
"""
        
        prompt = "Based on this channel's content and performance, suggest 5 video topics that would be engaging for the NextGen CE audience. Consider what topics are performing well and what gaps might exist."
        
        return self.analyze_with_ai(prompt, context)
    
    def analyze_top_performing_videos(self) -> str:
        """Analyze and report on top performing videos"""
        recent_videos = self.get_recent_videos(20)
        
        # Sort by views
        sorted_videos = sorted(recent_videos, 
                             key=lambda x: int(x.get('views', 0)), 
                             reverse=True)
        
        top_5 = sorted_videos[:5]
        
        analysis_data = "\n".join([
            f"{i+1}. {video['title']}\n   Views: {video.get('views', '0'):,} | "
            f"Likes: {video.get('likes', '0'):,} | Engagement Rate: "
            f"{(int(video.get('likes', 0)) / max(int(video.get('views', 1)), 1) * 100):.2f}%"
            for i, video in enumerate(top_5)
        ])
        
        context = f"Top 5 Performing Videos:\n{analysis_data}"
        prompt = "Analyze these top performing videos. What common themes, topics, or characteristics make them successful? Provide insights and recommendations."
        
        return self.analyze_with_ai(prompt, context)
    
    def get_comments_sentiment_analysis(self, video_id: str) -> str:
        """Analyze sentiment of comments on a video"""
        comments = self.get_video_comments(video_id, 50)
        
        if not comments:
            return "No comments found for analysis."
        
        comments_text = "\n".join([f"- {comment['author']}: {comment['text'][:100]}..." 
                                  for comment in comments[:20]])
        
        context = f"Video Comments (showing first 20 of {len(comments)}):\n{comments_text}"
        prompt = "Analyze the sentiment of these comments. What is the overall audience reaction? What feedback themes emerge? Are viewers engaged positively or negatively?"
        
        return self.analyze_with_ai(prompt, context)
    
    def interactive_chat(self):
        """Interactive chat interface with the AI agent"""
        print("="*60)
        print("NextGen CE YouTube Channel AI Agent")
        print("="*60)
        print("\nCommands:")
        print("  'stats' - Get channel statistics")
        print("  'videos' - Get recent videos")
        print("  'suggest' - Get content suggestions")
        print("  'top' - Analyze top performing videos")
        print("  'comments <video_id>' - Analyze video comments")
        print("  'help' - Show this help message")
        print("  'quit' - Exit the agent")
        print("\nOr ask any question about your channel!")
        print("="*60)
        
        while True:
            user_input = input("\nYou: ").strip()
            
            if not user_input:
                continue
            
            if user_input.lower() == 'quit' or user_input.lower() == 'exit':
                print("Goodbye!")
                break
            
            elif user_input.lower() == 'help':
                print("\nCommands:")
                print("  'stats' - Get channel statistics")
                print("  'videos' - Get recent videos")
                print("  'suggest' - Get content suggestions")
                print("  'top' - Analyze top performing videos")
                print("  'comments <video_id>' - Analyze video comments")
                print("  'quit' - Exit the agent")
            
            elif user_input.lower() == 'stats':
                print("\nFetching channel statistics...")
                summary = self.get_channel_statistics_summary()
                print(summary)
            
            elif user_input.lower() == 'videos':
                print("\nFetching recent videos...")
                videos = self.get_recent_videos(10)
                for i, video in enumerate(videos, 1):
                    print(f"\n{i}. {video['title']}")
                    print(f"   Views: {video.get('views', '0'):,} | Likes: {video.get('likes', '0'):,}")
                    print(f"   URL: {video['url']}")
            
            elif user_input.lower() == 'suggest':
                print("\nGenerating content suggestions...")
                suggestions = self.generate_content_suggestions()
                print(f"\n{suggestions}")
            
            elif user_input.lower() == 'top':
                print("\nAnalyzing top performing videos...")
                analysis = self.analyze_top_performing_videos()
                print(f"\n{analysis}")
            
            elif user_input.lower().startswith('comments '):
                video_id = user_input.split(' ', 1)[1].strip()
                print(f"\nAnalyzing comments for video {video_id}...")
                analysis = self.get_comments_sentiment_analysis(video_id)
                print(f"\n{analysis}")
            
            else:
                # General AI chat
                print("\nAnalyzing...")
                channel_info = self.get_channel_info()
                recent_videos = self.get_recent_videos(5)
                
                context = f"Channel: {channel_info.get('title')} with {channel_info.get('subscriber_count')} subscribers. Recent videos: {', '.join([v['title'] for v in recent_videos])}"
                response = self.analyze_with_ai(user_input, context)
                print(f"\nAI Agent: {response}")


def main():
    """Main function to run the YouTube Channel AI Agent"""
    agent = YouTubeChannelAIAgent(CHANNEL_ID, YOUTUBE_API_KEY, OPENAI_API_KEY)
    
    # Run interactive chat
    agent.interactive_chat()


if __name__ == "__main__":
    main()


#TASK 2: Emotion Recognition from Speech
#Objective: Recognize human emotions (e.g., happy, angry, sad) from speech audio.
#Approach: Apply deep learning and speech signal processing techniques.
#Key Features:
#Extract features like MFCCs (Mel-Frequency Cepstral Coefficients).
#Use models like CNN, RNN, or LSTM.
#Datasets: RAVDESS, TESS, or EMO-DB.
# ==========================================
# Emotion Recognition from Speech - Complete Package
# ==========================================
import os
import numpy as np
import librosa
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder, StandardScaler
from sklearn.svm import SVC
from sklearn.metrics import accuracy_score, classification_report

# ==========================================
# SETUP FUNCTIONS
# ==========================================

def setup_emotion_dataset():
    """Setup emotion recognition dataset folders"""
    
    dataset_path = r"D:\NEXTGEN CE\COMPUTER ENGINEERING PROGRAMMING\MACHINE LEARNING\PROGRAMMING OF MACHINE LEARNING\dataset"
    
    # Create main dataset folder
    os.makedirs(dataset_path, exist_ok=True)
    
    # Create emotion subfolders
    emotions = ['happy', 'sad', 'angry', 'neutral', 'fearful', 'surprised', 'disgust']
    
    print("=" * 70)
    print("CREATING EMOTION DATASET FOLDERS")
    print("=" * 70)
    print()
    
    for emotion in emotions:
        emotion_path = os.path.join(dataset_path, emotion)
        os.makedirs(emotion_path, exist_ok=True)
        print(f"✓ Created folder: {emotion_path}")
    
    print("\n" + "=" * 70)
    print("DATASET FOLDERS CREATED SUCCESSFULLY!")
    print("=" * 70)
    
    print("\n📁 Dataset Location:")
    print(f"   {dataset_path}")
    
    print("\n📂 Created Emotion Folders:")
    for emotion in emotions:
        print(f"   • {emotion}/")
    
    print("\n" + "=" * 70)
    print("NEXT STEPS - HOW TO ADD AUDIO FILES")
    print("=" * 70)
    
    print("\n🎯 METHOD 1: Download Free Datasets (RECOMMENDED)")
    print("-" * 70)
    print("\n1. RAVDESS Dataset (Most Popular):")
    print("   • URL: https://zenodo.org/record/1188976")
    print("   • Size: ~1.5 GB")
    print("   • Contains: 7,356 files, 24 actors, 8 emotions")
    print("   • Format: .wav files")
    
    print("\n2. TESS Dataset:")
    print("   • URL: https://tspace.library.utoronto.ca/handle/1807/24487")
    print("   • Size: Smaller, easier to start")
    print("   • Contains: 2,800 files, 7 emotions")
    
    print("\n3. CREMA-D Dataset:")
    print("   • URL: https://github.com/CheyneyComputerScience/CREMA-D")
    print("   • Contains: 7,442 files, 6 emotions")
    
    print("\n🤖 METHOD 2: Use Text-to-Speech (For Testing)")
    print("-" * 70)
    print("Quick way to test your code with sample files")
    print("Run: create_sample_audio_files()")
    
    print("\n" + "=" * 70)
    print("FILE ORGANIZATION GUIDE")
    print("=" * 70)
    print("\nAfter downloading, organize files like this:")
    print(f"\n{dataset_path}\\")
    print("├── happy\\")#happy folder
    print("│   ├── audio1.wav")
    print("│   ├── audio2.wav")
    print("│   └── ...")
    print("├── sad\\")#sad folder
    print("│   ├── audio1.wav")
    print("│   └── ...")
    print("├── angry\\")#angry folder
    print("│   └── ...")
    print("└── ...")
    
    print("\n📝 SUPPORTED AUDIO FORMATS:")
    print("   .wav, .mp3, .flac, .m4a, .ogg")
    
    print("\n💡 RECOMMENDATIONS:")
    print("   • Minimum: 10-20 files per emotion")
    print("   • Recommended: 50-100 files per emotion")
    print("   • More data = Better accuracy")
    
    print("\n" + "=" * 70)
    return dataset_path


def create_sample_audio_files():
    """Create sample audio files using TTS for immediate testing"""
    
    dataset_path = r"D:\NEXTGEN CE\COMPUTER ENGINEERING PROGRAMMING\MACHINE LEARNING\PROGRAMMING OF MACHINE LEARNING\dataset"
    
    print("\n" + "=" * 70)
    print("CREATING SAMPLE AUDIO FILES FOR TESTING")
    print("=" * 70)
    print()
    
    # Sample sentences for each emotion
    emotions = {
        'happy': [
            "I am so excited and happy today!",
            "This is wonderful news!",
            "I love this so much!",
            "What a beautiful day!",
            "I'm thrilled about this!"
        ],
        'sad': [
            "I feel so down and unhappy.",
            "This is really disappointing.",
            "I'm feeling very sad right now.",
            "Everything feels so heavy.",
            "I miss those happy days."
        ],
        'angry': [
            "This is absolutely unacceptable!",
            "I am very frustrated with this!",
            "This makes me so angry!",
            "I cannot believe this happened!",
            "This is outrageous!"
        ],
        'neutral': [
            "The weather forecast shows rain tomorrow.",
            "This is a standard procedure.",
            "The meeting is scheduled for three.",
            "Please read the instructions carefully.",
            "The document has been submitted."
        ],
        'fearful': [
            "I'm really scared about this.",
            "This is terrifying to think about.",
            "I'm worried something bad will happen.",
            "This situation frightens me.",
            "I don't feel safe here."#when you in danger such as hostage situation
        ]
    }
    
    try:
        from gtts import gTTS
        
        total_files = 0
        for emotion, sentences in emotions.items():
            emotion_path = os.path.join(dataset_path, emotion)
            os.makedirs(emotion_path, exist_ok=True)
            
            print(f"Creating {emotion} samples...")
            
            for i, sentence in enumerate(sentences, 1):
                try:
                    tts = gTTS(text=sentence, lang='en', slow=False)
                    filename = f"{emotion}_sample_{i}.mp3"
                    filepath = os.path.join(emotion_path, filename)
                    tts.save(filepath)
                    print(f"  ✓ Created: {filename}")
                    total_files += 1
                except Exception as e:
                    print(f"  ✗ Error creating {filename}: {e}") 
        
        print("\n" + "=" * 70)
        print(f"SUCCESS! Created {total_files} sample audio files")
        print("=" * 70)
        print("\n⚠️  NOTE: These are basic TTS files for testing purposes.")
        print("For better accuracy, download real emotion speech datasets.")
        print("\nYou can now run: train_emotion_model()")
        
    except ImportError:
        print("\n❌ ERROR: gtts library not installed!")
        print("\nTo install, run:")
        print("   pip install gtts")
        print("\nThen run this function again: create_sample_audio_files()")


# ==========================================
# FEATURE EXTRACTION
# ==========================================

def extract_mfcc(file_path, n_mfcc=40):
    """Extract MFCC features from an audio file."""
    audio, sr = librosa.load(file_path, duration=3, offset=0.5)
    mfcc = librosa.feature.mfcc(y=audio, sr=sr, n_mfcc=n_mfcc)
    mfcc = np.mean(mfcc.T, axis=0)
    return mfcc


# ==========================================
# MAIN TRAINING FUNCTION
# ==========================================

def train_emotion_model():
    """Train the emotion recognition model"""
    
    print("\n" + "=" * 70)
    print("EMOTION RECOGNITION FROM SPEECH - TRAINING")
    print("=" * 70)
    
    dataset_path = r"D:\NEXTGEN CE\COMPUTER ENGINEERING PROGRAMMING\MACHINE LEARNING\PROGRAMMING OF MACHINE LEARNING\dataset"
    
    # Check if dataset directory exists
    if not os.path.exists(dataset_path):
        print(f"\n❌ ERROR: Dataset directory '{dataset_path}' not found!")
        print("\n💡 Solution: Run setup_emotion_dataset() first to create folders")
        print("Then add audio files or run create_sample_audio_files()")
        return None
    
    print(f"\n📂 Loading dataset from: {dataset_path}")
    print("-" * 70)
    
    X = []
    y = []
    loaded_count = 0
    error_count = 0
    
    # Audio file extensions to check
    audio_extensions = {'.wav', '.mp3', '.flac', '.m4a', '.ogg'}
    
    for emotion in os.listdir(dataset_path):
        emotion_path = os.path.join(dataset_path, emotion)
        if not os.path.isdir(emotion_path):# if condition to check if the path is a directory
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
                print(f"  ⚠️  Warning: Could not process {file}: {str(e)}")
                error_count += 1
        
        print(f"  ✓ Loaded {emotion_count} files for {emotion}")
    
    print("-" * 70)
    print(f"Total files loaded: {loaded_count}")
    if error_count > 0:
        print(f"Files with errors: {error_count}")
    
    # Check if we have data
    if len(X) == 0:
        print("\n❌ ERROR: No audio files were loaded!")
        print("\n💡 Solutions:")
        print("  1. Run create_sample_audio_files() to create test files")
        print("  2. Or download a real dataset (RAVDESS, TESS)")
        print("  3. Or add your own audio files to the emotion folders")
        return None
    
    X = np.array(X)
    y = np.array(y)
    
    print(f"\n📊 Dataset shape: {X.shape}")
    print(f"📊 Number of emotions: {len(np.unique(y))}")
    
    # ------------------------------------------
    # Encode Labels & Normalize Features
    # ------------------------------------------
    print("\n" + "=" * 70)
    print("PREPROCESSING DATA")
    print("=" * 70)
    
    label_encoder = LabelEncoder()
    y_encoded = label_encoder.fit_transform(y)
    
    print(f"\n✓ Emotions found: {list(label_encoder.classes_)}")
    print(f"✓ Label mapping: {dict(zip(label_encoder.classes_, range(len(label_encoder.classes_))))}")
    
    scaler = StandardScaler()
    X_scaled = scaler.fit_transform(X)
    
    X_train, X_test, y_train, y_test = train_test_split(
        X_scaled, y_encoded, test_size=0.2, random_state=42
    )
    
    print(f"\n📊 Training samples: {len(X_train)}")
    print(f"📊 Test samples: {len(X_test)}")
    
    # ------------------------------------------
    # Train SVM Classifier
    # ------------------------------------------
    print("\n" + "=" * 70)
    print("TRAINING SVM CLASSIFIER")
    print("=" * 70)
    print("\n🔄 Training in progress...", end="", flush=True)
    
    svm_model = SVC(kernel='rbf', C=10, gamma='scale', random_state=42)
    svm_model.fit(X_train, y_train)
    
    print(" ✓ Done!")
    
    # ------------------------------------------
    # Evaluate Model
    # ------------------------------------------
    print("\n" + "=" * 70)
    print("MODEL EVALUATION")
    print("=" * 70)
    
    y_pred = svm_model.predict(X_test)
    
    accuracy = accuracy_score(y_test, y_pred)
    print(f"\n🎯 Test Accuracy: {accuracy * 100:.2f}%")
    
    print("\n📊 Classification Report:")
    print("-" * 70)
    print(classification_report(
        y_test,
        y_pred,
        target_names=label_encoder.classes_
    ))
    
    # ------------------------------------------
    # Save for prediction function
    # ------------------------------------------
    global trained_model, trained_scaler, trained_label_encoder
    trained_model = svm_model
    trained_scaler = scaler
    trained_label_encoder = label_encoder
    
    print("=" * 70)
    print("✅ TRAINING COMPLETED SUCCESSFULLY!")
    print("=" * 70)
    print("\n💡 You can now use: predict_emotion('audio_file.wav')")
    return svm_model, scaler, label_encoder
# ==========================================
# PREDICTION FUNCTION
# ==========================================
def predict_emotion(audio_file):
    """Predict emotion from an audio file."""
    if 'trained_model' not in globals():
        print("❌ ERROR: Model not trained yet!")
        print("💡 Run train_emotion_model() first")
        return None
    if not os.path.exists(audio_file):
        print(f"❌ ERROR: Audio file not found: {audio_file}")
        return None
    try:
        mfcc = extract_mfcc(audio_file)
        mfcc_scaled = trained_scaler.transform([mfcc])
        prediction = trained_model.predict(mfcc_scaled)
        emotion = trained_label_encoder.inverse_transform(prediction)
        return emotion[0]
    except Exception as e:
        print(f"❌ ERROR during prediction: {e}")
        return None
# ==========================================
# MAIN EXECUTION
# ==========================================
if __name__ == "__main__":
    print("\n" + "=" * 70)
    print("EMOTION RECOGNITION FROM SPEECH - COMPLETE SYSTEM")
    print("=" * 70)
    print("\n📋 MENU:")
    print("1. Setup dataset folders")
    print("2. Create sample audio files (for testing)")
    print("3. Train emotion recognition model")
    print("4. Exit")
    choice = input("\nEnter your choice (1-4): ").strip()
    if choice == '1':
        setup_emotion_dataset()
    elif choice == '2':
        create_sample_audio_files()
    elif choice == '3':
        result = train_emotion_model()
        if result:
            # Test prediction if model trained successfully
            print("\n" + "=" * 70)
            print("TESTING PREDICTION")
            print("=" * 70)
            dataset_path = r"D:\NEXTGEN CE\COMPUTER ENGINEERING PROGRAMMING\MACHINE LEARNING\PROGRAMMING OF MACHINE LEARNING\dataset"
            # Find a test file
            for emotion in os.listdir(dataset_path):
                emotion_path = os.path.join(dataset_path, emotion)
                if os.path.isdir(emotion_path):
                    files = [f for f in os.listdir(emotion_path) if f.endswith(('.wav', '.mp3'))]
                    if files:
                        test_file = os.path.join(emotion_path, files[0])
                        predicted = predict_emotion(test_file)
                        print(f"\n🎵 Test file: {files[0]}")
                        print(f"🎯 Predicted emotion: {predicted}")
                        print(f"📁 Actual folder: {emotion}")
                        break
    
    elif choice == '4':
        print("\n👋 Goodbye!")
    
    else:
        print("\n❌ Invalid choice!")
    
    print("\n" + "=" * 70)
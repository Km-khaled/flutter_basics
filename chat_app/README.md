# ChatApp

A modern cross-platform messaging application built with Flutter and Firebase.

![ChatApp Logo](/assets/images/chat.png)

## 📱 Features

- **Real-time Messaging**: Instantly send and receive messages
- **User Authentication**: Secure sign-up and login using Firebase Auth
- **Image Sharing**: Share images from camera or gallery
- **User Profiles**: Personalize your profile with custom images
- **Push Notifications**: Stay updated with Firebase Cloud Messaging
- **Responsive UI**: Works seamlessly across iOS and Android devices
- **Data Persistence**: Conversation history saved in Firebase Cloud Firestore

## 🛠️ Technologies Used

- **Flutter SDK**: Cross-platform UI toolkit
- **Firebase Authentication**: For user management
- **Cloud Firestore**: For storing and syncing messages in realtime
- **Firebase Storage**: For storing user-uploaded images
- **Firebase Cloud Functions**: For backend processing
- **Firebase Cloud Messaging**: For push notifications

## 📋 Prerequisites

- Flutter SDK (latest version)
- Dart SDK
- Android Studio / Xcode
- Firebase account and project setup
- For iOS: macOS with Xcode installed

## 🚀 Getting Started

### Setup Firebase

1. Create a new Firebase project at [Firebase Console](https://console.firebase.google.com/)
2. Enable Authentication (Email/Password)
3. Create a Firestore Database
4. Set up Storage for image uploads
5. Download the configuration files:
   - For Android: `google-services.json` and place it in the `android/app` directory
   - For iOS: `GoogleService-Info.plist` and place it in the `ios/Runner` directory

### Install Dependencies

```bash
flutter pub get
```

### iOS Specific Setup

Run in the iOS directory to install CocoaPods dependencies:

```bash
cd ios
pod install
cd ..
```

### Run the Application

```bash
flutter run
```

## 📱 App Structure

- **lib/screens/**
  - `auth.dart`: User authentication screen
  - `chat.dart`: Main chat interface
  - `splash.dart`: Loading screen
- **lib/widgets/**
  - `chat_messages.dart`: Displaying message history
  - `message_bubble.dart`: Individual message UI
  - `new_message.dart`: Message input component
  - `user_image_picker.dart`: For selecting user profile images

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 💬 Contact

If you have any questions or suggestions about the app, feel free to reach out!

---

Built with ❤️ using Flutter and Firebase.

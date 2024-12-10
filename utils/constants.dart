import 'package:flutter/material.dart';

class AppConstants {
  // Firebase Firestore collection names
  static const String messagesCollection = 'messages';
  static const String usersCollection = 'users';

  // Authentication error messages
  static const String invalidEmailError = 'The email address is invalid.';
  static const String weakPasswordError = 'The password is too weak.';
  static const String userNotFoundError = 'No user found with this email.';
  static const String wrongPasswordError = 'Incorrect password.';

  // UI Strings
  static const String appName = 'FlutterChat';
  static const String welcomeMessage = 'Welcome to FlutterChat!';
  static const String signInLabel = 'Sign In';
  static const String signUpLabel = 'Sign Up';
  static const String sendMessagePlaceholder = 'Type your message...';

  // Default profile picture
  static const String defaultProfilePicUrl = 'https://example.com/default-pic.png';

  // App theme colors
  static const Color primaryColor = Color(0xFF6200EA);
  static const Color secondaryColor = Color(0xFF03DAC6);
  static const Color backgroundColor = Color(0xFFF5F5F5);
}



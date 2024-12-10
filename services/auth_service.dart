import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Stream to listen for authentication state changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Get the current user
  User? get currentUser => _auth.currentUser;

  // Sign up a new user with email and password
  Future<User?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      throw Exception('Sign Up Error: $e');
    }
  }

  // Log in a user with email and password
  Future<User?> logIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      throw Exception('Log In Error: $e');
    }
  }

  // Log out the current user
  Future<void> logOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception('Log Out Error: $e');
    }
  }

  // Reset password
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw Exception('Password Reset Error: $e');
    }
  }

  // Delete the current user
  Future<void> deleteAccount() async {
    try {
      await currentUser?.delete();
    } catch (e) {
      throw Exception('Delete Account Error: $e');
    }
  }
}


import 'package:cyberking_capitals/app/data/providers/api/api_provider.dart';
import 'package:cyberking_capitals/app/data/providers/firebase_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepositry {
  final FirebaseProvider firebaseProvider;
  final ApiProvider apiProvider;
  AuthRepositry({required this.firebaseProvider, required this.apiProvider});

  Future<UserCredential?> signInWithGoogle(GoogleSignInAuthentication auth) {
    return firebaseProvider.signInWithGoogle(auth);
  }

  Future<UserCredential?> createCredentialWithEmail(
      String email, String displayName, String password) {
    return firebaseProvider.createCredentialWithEmail(
        email, displayName, password);
  }

  Future<UserCredential?> signInWithEmailPassword(
      String email, String password) {
    return firebaseProvider.signInWithEmailPassword(email, password);
  }

  Future<Response?> getProfile(String email) {
    return apiProvider.getProfile(email);
  }
}

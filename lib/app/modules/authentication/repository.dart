import 'package:cyberking_capitals/app/data/providers/firebase_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepositry {
  final FirebaseProvider firebaseProvider;
  AuthRepositry({required this.firebaseProvider});

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
}

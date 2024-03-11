import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> validateEmailVerification() async {
    _firebaseAuth.currentUser!.reload();
    if (_firebaseAuth.currentUser!.emailVerified) {
      return true;
    } else {
      return false;
    }
  }

  Future<UserCredential?> createCredentialWithEmail(
      String email, String displayName, String password) async {
    try {
      UserCredential credential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserCredential?> signInWithEmailPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserCredential?> signInWithGoogle(
      GoogleSignInAuthentication auth) async {
    try {
      final cred = GoogleAuthProvider.credential(
          accessToken: auth.accessToken, idToken: auth.idToken);

      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(cred);

      return userCredential;
    } catch (e) {
      rethrow;
    }
  }

  // signOut the Account
  Future<bool> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }
}

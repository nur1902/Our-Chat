import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Open Google account selection
      final GoogleSignInAccount googleUser =
      await _googleSignIn.authenticate();

      // Get Google authentication
      final GoogleSignInAuthentication googleAuth =
          googleUser.authentication;

      // Create Firebase credential
      final AuthCredential credential =
      GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase
      final UserCredential userCredential =
      await _auth.signInWithCredential(credential);

      return userCredential;
    } on GoogleSignInException catch (e) {
      print('Google Sign-In Error: ${e.code}');
      print('Description: ${e.description}');
      return null;
    } on FirebaseAuthException catch (e) {
      print('Firebase Auth Error: ${e.code}');
      print('Message: ${e.message}');
      return null;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  User? get currentUser => _auth.currentUser;
}
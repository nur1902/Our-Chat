import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:our_chat/Paths/asset_paths.dart';
import 'package:our_chat/Provider/user_info_provider.dart';
import 'package:our_chat/Screens/landing_page.dart';
import 'package:our_chat/SignIN/auth_service.dart';
import 'package:our_chat/SignIN/user_info.dart';
import 'package:our_chat/Widget/background.dart';
import 'package:provider/provider.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

// Future<void> service()async {
//   final authService = AuthService();
//   final userCredential = authService.signInWithGoogle();
//   authService.signInWithGoogle();
//   print("hello fuckers...............................................................................");
//
// }


final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

Future<UserCredential?> signInWithGoogle(BuildContext context) async {
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
    print(googleUser.displayName);
    final provider = context.read<UserInfoProvider>();
    provider.saveUserInfo(googleUser.displayName!, googleUser.email, googleUser.id, googleUser.photoUrl!);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LandingPage(),));
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

Future<void> checkLogin(BuildContext context) async {
  final provider = context.read<UserInfoProvider>();
  bool isLoggedIn = await provider.isLogedin();
  print('your states..........................${await provider.isLogedin()}');

  if (isLoggedIn) {
    print("User is logged in");
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserInfoScreen(),));
  } else {
    print("User is not logged in");
  }
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  void initState() {
    // TODO: implement initState
    checkLogin(context);


    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Future<void> callservice()async {
      signInWithGoogle(context);
    }

    return  Scaffold(
      body: Background(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
        
              InkWell(
                onTap: callservice,
                child: Container(
                  decoration: BoxDecoration(color: Colors.green.shade400,
                  borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Image.asset(AssetPaths.google_logo, height: 35, width: 35,),
                      Text("Log in with google", style: TextStyle(fontSize: 25),)

                  ],),
                ),
              )
            
          ],),
        ),
      ),
    );
  }
}

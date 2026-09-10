import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import 'Provider/user_info_provider.dart';
import 'Screens/landing_page.dart';
import 'firebase_options.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GoogleSignIn.instance.initialize(
    serverClientId: '296497583713-2qus43bbm901embekshjv231hvn8leg9.apps.googleusercontent.com',
  );

  runApp(


      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => UserInfoProvider()),

        ],
        child: const MyApp(),
      )
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home:  LandingPage(),
    );
  }
}

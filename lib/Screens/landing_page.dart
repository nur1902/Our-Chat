import 'package:flutter/material.dart';
import 'package:our_chat/SignIN/sign_in_screen.dart';
import 'package:our_chat/SignIN/user_info.dart';
import 'package:our_chat/Widget/background.dart';
class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Our Chats'),
      backgroundColor: Colors.green.shade50,
        actions: [
          Container(
              decoration: BoxDecoration(color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12)
              ),
              child: IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen(),));}, icon: Icon(Icons.person), iconSize: 30,)),

          SizedBox(width: 15,)
        ],
      ),

      body: Background(child: Column(
        children: [
            
        ],
      )),
    );
  }
}

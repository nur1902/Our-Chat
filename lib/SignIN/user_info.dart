import 'package:flutter/material.dart';
import 'package:our_chat/Widget/background.dart';

class UserInfoScreen extends StatefulWidget {
   UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Your Profile"),
        backgroundColor: Colors.green.shade50,

      ),
      body: Background(child: Column(
        children: [
          Text("Your Information")
        ],
      )),

    );
  }
}

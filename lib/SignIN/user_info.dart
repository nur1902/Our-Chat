import 'package:flutter/material.dart';
import 'package:our_chat/Provider/user_info_provider.dart';
import 'package:our_chat/Screens/landing_page.dart';
import 'package:our_chat/Widget/background.dart';
import 'package:provider/provider.dart';

class UserInfoScreen extends StatefulWidget {
   UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}


String ?name;
String ?email;
String ?token;
String ?profileUrl;

Future<void> profile()async{
  List<dynamic> profileInfo=await UserInfoProvider.profileInfo();
  name=profileInfo[0];
  email=profileInfo[1];
  token=profileInfo[2];
  profileUrl=profileInfo[3];

  print("$name\n$email\n $profileUrl");

}

Future<void> logOut(BuildContext context) async{

  showDialog(context: context, builder: (context) => AlertDialog(title: Text("you are signin out....."),
  actions: [
    TextButton(onPressed: (){
      Navigator.pop(context);
    }, child: Text("Cancel"))
  ],
  ),);

  //UserInfoProvider.clearData;
  //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LandingPage(),));
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  @override
  void initState() {
    // TODO: implement initState
    profile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Consumer<UserInfoProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        Future<void> callLogout()async {
          logOut(context);
        }
        return Scaffold(
        appBar: AppBar(
          title: Text("Your Profile"),
          backgroundColor: Colors.green.shade50,
          actions: [
            IconButton(onPressed: callLogout, icon: Icon(Icons.logout_rounded))
          ],

        ),
        body: Background(child: Column(
          children: [
            Text("Your Information"),
            Text("Name: ${name}"),

            Container(
              height: 100,
                width: 100,
                //decoration: BoxDecoration(borderRadius: BorderRadius.circular(50) ),
                child: Image.network("${profileUrl}",fit: BoxFit.fill,height: 20,width: 20,)
            ),
          ],
        )),

      );  },

    );
  }
}

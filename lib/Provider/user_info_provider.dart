import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserInfoProvider extends ChangeNotifier{


   static Future<void> saveUserInfo(String name, String email, String token , String profileUrl)async {
      SharedPreferences preferences=await SharedPreferences.getInstance();
      preferences.setString("name", name);
      preferences.setString("email", email);
      preferences.setString('token', token);
      preferences.setString("profileUrl", profileUrl);


   }

   static Future<List> profileInfo() async{
      SharedPreferences preferences= await SharedPreferences.getInstance();
      return [
         preferences.getString("name"),
         preferences.getString("email"),
         preferences.getString("token"),
         preferences.getString("profileUrl")
      ];
   }

   static Future<bool> isLogedin()async {
      SharedPreferences preferences= await SharedPreferences.getInstance();
      if(preferences.getString('token') != null){return true;}
      else return false;
   }

   static Future<void> clearData() async{
      SharedPreferences preferences= await SharedPreferences.getInstance();
      preferences.clear();

   }


}
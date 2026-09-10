import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:our_chat/SignIN/user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserInfoProvider extends ChangeNotifier{

     String ?_name;
    String ?_email;
    String ?_token;
    String ?_photourl;

    String? get name => _name;
     String? get email => _email;
     String? get token => _token;
     String? get profileUrl => _photourl;



    Future<void> saveUserInfo(String name, String email, String token , String profileUrl)async {
      SharedPreferences preferences=await SharedPreferences.getInstance();
      preferences.setString("name", name);
      preferences.setString("email", email);
      preferences.setString('token', token);
      preferences.setString("profileUrl", profileUrl);
      this._name=name;
      this._email=email;
      this._token=token;
      this._photourl=profileUrl;
      notifyListeners();

   }

    Future<List> profileInfo() async{
      return [
        _name, _email, _token, _photourl

      ];


   }

    Future<bool> isLogedin()async {
      SharedPreferences preferences= await SharedPreferences.getInstance();
      if(preferences.getString('token') != null){return true;}
      else return false;
   }

    Future<void> clearData() async{
      SharedPreferences preferences= await SharedPreferences.getInstance();
      preferences.clear();


   }


}
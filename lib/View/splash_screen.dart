import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Core/Service/login_service.dart';
import 'package:todo_app/View/home_page.dart';
import 'package:todo_app/View/login_page.dart';

import '../Core/Models/user_model.dart';
import '../Core/Service/shared_pref.dart';


class SplashScreen extends StatelessWidget {
    SplashScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

    return Scaffold(backgroundColor: Colors.blue,
      body: AnimatedSplashScreen.withScreenFunction(
        splash: 'assets/splash.png',
        splashIconSize: 300,
        backgroundColor: Colors.blue.shade50,
        screenFunction: () async {
          var uid= Prefs.getStringValue('uid')??'';
          var loginState = Prefs.getBooleanValue('loginState') ?? false;
          await delay();
          if (loginState) {
            var user =await getUserDData(uid);
            return MyHomePage( user);
          } else {
            return LogIn_Page();
          }
        },
        splashTransition: SplashTransition.fadeTransition,
      ),
    ) ;
  }
    Future<void> delay() async {
      await Future.delayed(Duration(seconds: 3));
    }

    Future<UserModel> getUserDData(String uid) async {

      return await getUser(uid);
    }
}


import 'dart:async';


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:after_layout/after_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tsareeh/Screens/Login/login_screen.dart';
import 'package:tsareeh/Screens/home/home_screen.dart';
import 'package:tsareeh/introduction_animation/introduction_animation_screen.dart';


class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> with AfterLayoutMixin<Splash> {
  final auth = FirebaseAuth.instance;
  User? user;

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      if(FirebaseAuth.instance.currentUser == null && user?.uid == null) {
        Navigator.of(context).pushReplacement(
            new MaterialPageRoute(builder: (context) => new LoginScreen()));
      }else{
        Navigator.of(context).pushReplacement(
            new MaterialPageRoute(builder: (context) => new HomeScreen()));
      }
    }

    else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new IntroductionAnimationScreen()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text('Loading...'),
      ),
    );
  }
}
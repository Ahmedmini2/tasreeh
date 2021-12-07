import 'package:flutter/material.dart';
import 'package:tsareeh/Screens/Login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tsareeh/Screens/Signup/Models/user_modle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tsareeh/Screens/profile/contactus/contact.dart';
import 'package:app_settings/app_settings.dart';


import 'profile_menu.dart';
import 'profile_pic.dart';

class SettingsBody extends StatefulWidget {
  _SettingsBody createState() => _SettingsBody();

}
class _SettingsBody extends State<SettingsBody> {


  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState(){
    super.initState();
    FirebaseFirestore.instance
        .collection("users").doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SizedBox(height: 20),
          ProfileMenu(
            text: "Application Language",
            icon: "assets/icons/Question mark.svg",
            press: () => {

            },
          ),
          ProfileMenu(
            text: "Allow Push Messages",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Camera Permission",
            icon: "assets/icons/Settings.svg",
            press: () {
              AppSettings.openAppSettings();
            },
          ),
          ProfileMenu(
            text: "Location Permission",
            icon: "assets/icons/Settings.svg",
            press: () {

                AppSettings.openAppSettings();

            },
          ),



        ],
      ),
    );
  }
}

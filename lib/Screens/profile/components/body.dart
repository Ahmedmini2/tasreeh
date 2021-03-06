import 'package:flutter/material.dart';
import 'package:tsareeh/Screens/Login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tsareeh/Screens/Signup/Models/user_modle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tsareeh/Screens/profile/contactus/contact.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tsareeh/Screens/profile/settings/settings.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';
import 'package:google_sign_in/google_sign_in.dart';


class Body extends StatefulWidget {
  _Body createState() => _Body();

}
class _Body extends State<Body> {




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
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "${loggedInUser.userName}",
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "Request QR-Code Change",
            icon: "assets/icons/Bell.svg",
            press: () {
              Fluttertoast.showToast(msg: 'Your Request Have been send seccessfully Please wait');
            },
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {
              Navigator.push(context, new MaterialPageRoute(
                  builder: (context) => new SettingsScreen()));
            },
          ),
          ProfileMenu(
            text: "Contact Us",
            icon: "assets/icons/Question mark.svg",
            press: () {
              Navigator.push(context, new MaterialPageRoute(
                  builder: (context) => new ContactUS()));
            },
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () async {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  LoginScreen()), (Route<dynamic> route) => false);
              FirebaseAuth.instance.signOut();
              await GoogleSignIn().signOut();

            },
          ),

        ],
      ),
    );
  }
}

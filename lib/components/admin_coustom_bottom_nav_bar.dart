import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tsareeh/Screens/Login/login_screen.dart';

import 'package:tsareeh/Screens/home/Admin%20Dashboard/dashboard.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:tsareeh/Screens/Signup/Models/user_modle.dart';
import 'package:google_sign_in/google_sign_in.dart';


import '../constants.dart';
import '../enums.dart';

class AdminCustomBottomNavBar extends StatelessWidget {
   AdminCustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();



  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Shop Icon.svg",
                  color: MenuState.home == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.push(context, new MaterialPageRoute(
                        builder: (context) => new Dashboard())
                    ),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Log out.svg",
                  color: MenuState.home == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () async {
                  Navigator.push(context, new MaterialPageRoute(
                      builder: (context) => new LoginScreen())
                  );
                  FirebaseAuth.instance.signOut();
                  await GoogleSignIn().signOut();
                }

              ),


            ],
          )),
    );
  }
}

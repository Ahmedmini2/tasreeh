import 'package:flutter/material.dart';
import 'package:contactus/contactus.dart';
import 'package:tsareeh/Screens/profile/components/settings_body.dart';

import 'package:tsareeh/components/coustom_bottom_nav_bar.dart';



class SettingsScreen extends StatelessWidget {
  static String routeName = "/contact";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9E9EA),
      appBar: AppBar(
        backgroundColor: Color(0xFF79B033),
        title: Text("Profile"),
      ),
      body: SettingsBody());
  }
}

import 'package:flutter/material.dart';
import 'package:tsareeh/components/coustom_bottom_nav_bar.dart';

import '../../enums.dart';
import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9E9EA),
      appBar: AppBar(
        backgroundColor: Color(0xFF79B033),
        title: Text("Profile"),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}

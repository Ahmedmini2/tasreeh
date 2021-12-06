import 'package:flutter/material.dart';
import 'package:tsareeh/Screens/home/components/abmin_body.dart';
import 'package:tsareeh/components/admin_coustom_bottom_nav_bar.dart';



import '../../../enums.dart';
import '../components/body.dart';

class Dashboard extends StatelessWidget {
  static String routeName = "/dashboard";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9E9EA),
      body: AdminBody(),
      bottomNavigationBar: AdminCustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}

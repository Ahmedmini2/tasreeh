import 'package:flutter/material.dart';
import 'package:tsareeh/Screens/QR-Code/componants/body.dart';
import 'package:tsareeh/Screens/QR-Code/componants/bodyrandom.dart';

import 'package:tsareeh/components/coustom_bottom_nav_bar.dart';

import '../../enums.dart';


class RandomQR extends StatelessWidget {
  static String routeName = "/Genrator";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9E9EA),
      body: BodyRandom(),

      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tsareeh/Screens/home/components/admin_home_header.dart';
import 'package:tsareeh/Screens/home/components/admin_services.dart';

import '../../../size_config.dart';



class AdminBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:20),
            AdminHomeHeader(),




            SizedBox(height: 30),
            AdminServices(),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

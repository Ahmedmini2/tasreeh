import 'package:flutter/material.dart';
import 'package:contactus/contactus.dart';

import 'package:tsareeh/components/coustom_bottom_nav_bar.dart';



class ContactUS extends StatelessWidget {
  static String routeName = "/contact";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9E9EA),
      appBar: AppBar(
        backgroundColor: Color(0xFF79B033),
        title: Text("Profile"),
      ),
      body: Column(
        children: [
          SizedBox(height: 40,),
          ContactUs(
            logo: AssetImage('assets/images/applogo.png'),
            email: 'tasreeh@gmail.com',
            companyName: 'Tasreeh ',
            phoneNumber: '+971562374807',
            dividerThickness: 2,
            tagLine: 'Smart Solutions',
            taglineColor: Colors.black38,
            dividerColor: Colors.lightGreen,
            textColor: Colors.black,
            cardColor: Colors.white,
            companyColor: Colors.lightGreen,

          ),
        ],
      ),
      bottomNavigationBar:ContactUsBottomAppBar(
        companyName: 'Tasreeh',
        textColor: Colors.white,
        backgroundColor: Colors.lightGreen,
        email: 'tasreeh@gmail.com',
      ),
    );
  }
}

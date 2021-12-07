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
      body: ContactUs(
        logo: AssetImage('images/crop.jpg'),
        email: 'adoshi26.ad@gmail.com',
        companyName: 'Abhishek Doshi',
        phoneNumber: '+91123456789',
        dividerThickness: 2,
        website: 'https://abhishekdoshi.godaddysites.com',
        githubUserName: 'AbhishekDoshi26',
        linkedinURL: 'https://www.linkedin.com/in/abhishek-doshi-520983199/',
        tagLine: 'Flutter Developer',
        twitterHandle: 'AbhishekDoshi26',
        taglineColor: Colors.lightGreen,
        textColor: Colors.black,
        cardColor: Colors.white,
        companyColor: Colors.lightGreen,

      ),
      bottomNavigationBar:ContactUsBottomAppBar(
        companyName: 'Abhishek Doshi',
        textColor: Colors.white,
        backgroundColor: Colors.teal.shade300,
        email: 'adoshi26.ad@gmail.com',
      ),
    );
  }
}

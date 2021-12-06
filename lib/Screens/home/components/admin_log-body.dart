import 'package:flutter/material.dart';
import 'package:tsareeh/Screens/home/components/admin_home_header.dart';
import 'package:tsareeh/Screens/home/components/admin_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';





class AdminLogBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:20),
          Padding(
            padding:
            EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(" Log File " ,style: TextStyle(fontSize: 25),)
              ],
            ),
          ),
               ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:tsareeh/Screens/QR-Code/componants/qr_header.dart';
import 'package:tsareeh/components/rounded_button.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tsareeh/Screens/Signup/Models/user_modle.dart';
import 'package:intl/intl.dart';

import '../../../constants.dart';





class BodyRandom extends StatefulWidget {

  _BodyRandom createState() => _BodyRandom();


}
class _BodyRandom extends State<BodyRandom> {

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  DateTime now = DateTime.now();
  String get formattedDate => DateFormat('kk:mm:ss \n EEE d MMM yy').format(now);


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
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height:50),
            QRHeader(),
            SizedBox(height:80),
            QrImage(

              data: 'Access For ${loggedInUser.userName} Visitor \n Time Stamp :'+ formattedDate,
              size: 300,
            ),


            TextField(



              cursorColor: kPrimaryColor,
              decoration: InputDecoration(

                labelText: 'Access For ${loggedInUser.userName} Visitor \n Time Stamp : 30M' ,
                enabled: false,
                border: InputBorder.none,
              ),
            ),

            SizedBox(height:40),



            RoundedButton(
              text: "Save",
              press: () {

              },
            ),




            SizedBox(height: 30),


            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

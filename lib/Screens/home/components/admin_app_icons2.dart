import 'package:flutter/material.dart';

import 'package:tsareeh/Screens/QR-Code/scanner.dart';
import 'package:tsareeh/Screens/home/Admin%20Dashboard/admin_log.dart';
import 'package:tsareeh/Screens/home/Admin%20Dashboard/admin_qr_request.dart';



class AdminCatigoryW2 extends StatelessWidget {
  String image;
  String text;
  Color color;
  int number;

  AdminCatigoryW2({required this.image, required this.text, required this.color , required this.number});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      child: Container(

        height: 160,
        width: 160,
        padding: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xCBFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Image.asset(
              image,
              width: 80,
              height: 80,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              text,
              style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: 'BankGR'),
            ),
          ],
        ),
      ),
      onTap: () {
        if(this.number == 100 ){
          Navigator.push(context, new MaterialPageRoute(
              builder: (context) => new Scanner())
          );
        } else if(this.number == 101 ){
          Navigator.push(context, new MaterialPageRoute(
              builder: (context) => new AdminLog())
          );

      } else if(this.number == 102 ){
      Navigator.push(context, new MaterialPageRoute(
          builder: (context) => new AdminQRRequest())
      );
    }






      },







    );
  }
}
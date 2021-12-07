import 'package:flutter/material.dart';
import 'package:tsareeh/Screens/QR-Code/componants/body2.dart';
import 'package:tsareeh/Screens/QR-Code/genrator.dart';
import 'package:tsareeh/Screens/QR-Code/scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';


class CatigoryW2 extends StatelessWidget {
  String image;
  String text;
  Color color;
  int number;

  CatigoryW2({required this.image, required this.text, required this.color , required this.number});

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
        if(this.number == 200 ){
          Navigator.push(context, new MaterialPageRoute(
              builder: (context) => new Genrator())
          );
        } else if(this.number == 0 ){
          Fluttertoast.showToast(msg: 'Comming Soon');

        }






      },







    );
  }
}
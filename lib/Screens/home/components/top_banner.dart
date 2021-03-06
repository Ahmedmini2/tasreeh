import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tsareeh/Screens/QR-Code/genrator.dart';
import 'package:tsareeh/Screens/QR-Code/random_qr.dart';
import 'package:tsareeh/Screens/Request%20Qr%20Code/myrequest.dart';
import 'package:tsareeh/Screens/Request%20Qr%20Code/requestqr.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class TopBanner extends StatelessWidget {
  const TopBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal:20),
          child: SectionTitle(
            title: "Request",
            press: () {},
          ),
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    SpecialOfferCard(
                      image: "assets/images/Artboard 12.png",
                      category: "",
                      numOfBrands: 15,
                      press: () {
                        Navigator.push(context, new MaterialPageRoute(
                            builder: (context) => new RandomQR()));
                      },
                    ),
                    SizedBox(height: 10,),
                    Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text("Visitor Qr-Code")),
                  ]),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
              SpecialOfferCard(
                image: "assets/images/Artboard 10.png",
                category: "",
                numOfBrands: 24,
                press: () {
                  Navigator.push(context, new MaterialPageRoute(
                      builder: (context) => new RequestQR()));
                },
              ),
                    SizedBox(height: 10,),
                    Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text("Request Qr Code")),
                  ]),

              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    SpecialOfferCard(
                      image: "assets/images/Artboard 8.png",
                      category: "",
                      numOfBrands: 24,
                      press: () {
                        Navigator.push(context, new MaterialPageRoute(
                            builder: (context) => new MyRequest()));
                      },
                    ),
                    SizedBox(height: 10,),
                    Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text("My Codes")),
                  ]),

            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left:20),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: 200,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                Container(

                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.1),
                        Color(0xFF343434).withOpacity(0.05),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [

                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

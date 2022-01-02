import 'package:flutter/material.dart';


import '../../../size_config.dart';
import 'app_icons2.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(title: "Services", press: () {}),
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          child: Column(



              children: <Widget>[
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                CatigoryW2(
                  image: 'assets/images/Artboard 40.png',
                  text: 'QR-Code',

                  color: const Color(0x9ED9D9D9),
                  number: 200,
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                CatigoryW2(
                  image: 'assets/images/Artboard 4.png',
                  text: 'Fingerprint',

                  color: const Color(0x9ED9D9D9),
                  number: 0,
                ),
              ]),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),

                Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      CatigoryW2(
                        image: 'assets/images/Artboard 3.png',
                        text: 'Face',

                        color: const Color(0x9ED9D9D9),
                        number: 0,
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                      CatigoryW2(
                        image: 'assets/images/service1.png',
                        text: 'Password',

                        color: const Color(0x9ED9D9D9),
                        number: 0,
                      ),
                    ]),
          Padding(padding: EdgeInsets.symmetric(vertical: 10)),

          Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                CatigoryW2(
                  image: 'assets/images/Artboard 93.png',
                  text: 'WiFi Open',

                  color: const Color(0x9ED9D9D9),
                  number: 0,
                ),
        ]),

              ]),





        )
      ],
    );
  }
}

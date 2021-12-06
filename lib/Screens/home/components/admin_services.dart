import 'package:flutter/material.dart';
import 'package:tsareeh/Screens/home/components/admin_app_icons2.dart';


import '../../../size_config.dart';


class AdminServices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          SizedBox(height: 20),
          SingleChildScrollView(
            child: Column(



                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        AdminCatigoryW2(
                          image: 'assets/images/Artboard 40.png',
                          text: 'QR-Code Scanner',

                          color: const Color(0x9ED9D9D9),
                          number: 100,
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                        AdminCatigoryW2(
                          image: 'assets/images/logfile.png',
                          text: 'Log File',

                          color: const Color(0x9ED9D9D9),
                          number: 101,
                        ),
                      ]),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        AdminCatigoryW2(
                          image: 'assets/images/Artboard 52.png',
                          text: ' Qr Code For Visitor',

                          color: const Color(0x9ED9D9D9),
                          number: 102,
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 10)),

                      ]),

                ]),





          )
        ],
      );
  }
}

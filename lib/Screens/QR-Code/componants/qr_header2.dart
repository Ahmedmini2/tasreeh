import 'package:flutter/material.dart';




class QRHeader2 extends StatelessWidget {
  const QRHeader2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text(" QR Scanner " ,style: TextStyle(fontSize: 25),)
        ],
      ),
    );
  }
}

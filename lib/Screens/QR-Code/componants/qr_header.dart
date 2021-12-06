import 'package:flutter/material.dart';




class QRHeader extends StatelessWidget {
  const QRHeader({
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

          Text(" QR GENERATOR " ,style: TextStyle(fontSize: 35),)
        ],
      ),
    );
  }
}

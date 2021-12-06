import 'package:flutter/material.dart';


import '../../../size_config.dart';



class AdminHomeHeader extends StatelessWidget {
  const AdminHomeHeader({
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

          Text(" Admin Dashboard " ,style: TextStyle(fontSize: 25),)
        ],
      ),
    );
  }
}

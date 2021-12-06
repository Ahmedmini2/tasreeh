import 'package:flutter/material.dart';


import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';


class HomeHeader extends StatelessWidget {
  const HomeHeader({
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

          Text(" Tasreeh " ,style: TextStyle(fontSize: 25),)
        ],
      ),
    );
  }
}

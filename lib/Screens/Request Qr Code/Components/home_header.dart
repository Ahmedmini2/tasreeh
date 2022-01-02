import 'package:flutter/material.dart';


import '../../../size_config.dart';



class HomeHeaderRequest extends StatelessWidget {
  const HomeHeaderRequest({
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

          Text(" Request " ,style: TextStyle(fontSize: 25),)
        ],
      ),
    );
  }
}

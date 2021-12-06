import 'package:flutter/material.dart';
import 'package:tsareeh/components/text_field_container.dart';


import '../constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  late TextEditingController controller;
   RoundedPasswordField({

    required this.onChanged,
    required this.controller,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(

      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        controller: controller,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

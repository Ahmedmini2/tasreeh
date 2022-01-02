import 'package:flutter/material.dart';

import 'package:tsareeh/components/text_field_container.dart';

import '../../../constants.dart';

class RoundedCompanyName extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  late TextEditingController controller;
  RoundedCompanyName({

    required this.hintText,
    required this.icon,
    required this.onChanged,
    required this.controller,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;


  static double? defaultSize;
  static Orientation? orientation;

  void initial(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);


    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size


  // 812 is the layout height that designer use




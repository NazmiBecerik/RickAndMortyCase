import 'package:flutter/material.dart';

class ColorConstants {
  static ColorConstants instance = ColorConstants._init();
  ColorConstants._init();

  static const grey = Color(0xff929292);
  static const appleBlossom = Color(0xffb04b4b);
  static const white = Color(0xFFECECEC);
  static const green = Color(0xFF00FF00);
  static const red = Colors.red;
  static const black = Colors.black;
  static const darkBlue = Color(0xFF478cab);
  static const Color primaryColor = Color(0xff202329);
  static const Color secondaryColor = Color(0xff3c3e44);
  static const Color portalColor = Color(0xff202329);
  static const Color aliveColor = Color(0xff617734);
  static const Color deadColor = Color(0xffe85356);

  static colorStatus(String status) {
    return status == 'Alive'
        ? ColorConstants.aliveColor
        : status == 'Dead'
        ? ColorConstants.deadColor
        : Colors.grey;
  }
}
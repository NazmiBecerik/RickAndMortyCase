import 'package:flutter/material.dart';

class FontConstants {
  static Function kollektifHeadline1 =
      ({Color color = Colors.white}) => _kollektif(color, 28, FontWeight.bold);
  static Function kollektifHeadline2 =
      ({Color color = Colors.white}) => _kollektif(color, 24, FontWeight.bold);

  static Function kollektifSubtitleBold =
      ({Color color = Colors.white}) => _kollektif(color, 18, FontWeight.bold);

  static Function kollektifSubtitleRegular = ({Color color = Colors.white}) =>
      _kollektif(color, 18, FontWeight.normal);
  static Function kollektifCaptionRegularBold =
      ({Color color = Colors.white}) => _kollektif(color, 14, FontWeight.w700);

  static Function kollektifMainBold =
      ({Color color = Colors.white}) => _kollektif(color, 16, FontWeight.w700);

  static Function kollektifMainRegular = ({Color color = Colors.white}) =>
      _kollektif(color, 16, FontWeight.normal);

  static Function kollektifCaptionBold =
      ({Color color = Colors.white}) => _kollektif(color, 14, FontWeight.bold);

  static Function kollektifCaptionRegular = ({Color color = Colors.white}) =>
      _kollektif(color, 14, FontWeight.normal);

  static Function kollektifSmallRegular = ({Color color = Colors.white}) =>
      _kollektif(color, 12, FontWeight.normal);

  static Function kollektifButton = ({Color color = Colors.white}) =>
      _kollektif(color, 16, FontWeight.normal);

  static Function kollektifCustom = (
      {Color color = Colors.white,
        double size = 16,
        FontWeight fontWeight = FontWeight.normal}) =>
      _kollektif(color, size, fontWeight);

  static TextStyle _kollektif(Color color, double size, FontWeight fontWeight) {
    return _textStyle("Kollektif", color, size, fontWeight);
  }

  static TextStyle _textStyle(
      String fontFamily, Color color, double size, FontWeight fontWeight) {
    return TextStyle(
        fontFamily: fontFamily,
        color: color,
        fontSize: size,
        fontWeight: fontWeight);
  }
}
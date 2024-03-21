import 'package:flutter/material.dart';

class PaddingConstants {
  static PaddingConstants instance = PaddingConstants._init();
  PaddingConstants._init();

  final paddingAllLow = const EdgeInsets.all(8.0);
  final paddingAllMid = const EdgeInsets.all(16.0);
  final paddingAllHigh = const EdgeInsets.all(32.0);
}
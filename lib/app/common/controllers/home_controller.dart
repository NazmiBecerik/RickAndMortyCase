import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vatan_soft_case/app/views/character/character_list_view.dart';
import 'package:vatan_soft_case/app/views/settings/settings_view.dart';

class HomeController extends GetxController{
  final Rx<int> currentScreenIndex = 0.obs ;
  final screens = [CharacterList(),Settings()];
}
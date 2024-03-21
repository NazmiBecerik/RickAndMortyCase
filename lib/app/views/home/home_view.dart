import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vatan_soft_case/app/common/controllers/home_controller.dart';
import 'package:vatan_soft_case/app/views/character/character_list_view.dart';
import 'package:vatan_soft_case/core/constants/color_constants.dart';
import 'package:vatan_soft_case/core/utils/lang/translation_keys.dart' as translation;

class Home extends StatefulWidget {

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx (
        () => NavigationBar(
          backgroundColor: ColorConstants.aliveColor,
          height: 50,
          elevation: 10,
          selectedIndex: homeController.currentScreenIndex.value,
          onDestinationSelected: (value){ homeController.currentScreenIndex.value = value;
            setState(() {
              
            });},
          destinations: [
            NavigationDestination(icon: Icon(Icons.list), label: translation.characterList.tr),
            NavigationDestination(icon: Icon(Icons.settings), label: translation.settings.tr)
          ],
        ),
      ),
      body:homeController.screens[homeController.currentScreenIndex.value] ,
    );
  }
}

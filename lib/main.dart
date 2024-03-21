import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:vatan_soft_case/app/common/controllers/home_controller.dart';
import 'package:vatan_soft_case/app/views/home/home_view.dart';
import 'package:vatan_soft_case/app/views/character/character_controller.dart';
import 'package:vatan_soft_case/core/utils/custom_theme.dart';
import 'package:vatan_soft_case/core/utils/messages.dart';
Future<void> main() async {
  Get.put(CharacterController());
  Get.put(HomeController());
  await Hive.initFlutter();
  await Hive.openBox('settings');
  runApp(const MyApp());
}
// Tema ve Dilde önce cihazın ayarları getirilecek deneme için bu şekilde yapıldı.
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const IconData characters = IconData(0xe800);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('settings').listenable(),
      builder: (context, box, child) {
        final isDark = box.get('isDark',defaultValue:false);
        final isEnglish = box.get('isEnglish',defaultValue:true);
       return GetMaterialApp(
         translations: Messages(),
         locale: isEnglish ?  Locale('en', 'EN') : Locale('tr', 'TR'),
          title: 'Rick And Morty',
          theme: isDark ?ThemeData.dark():ThemeData(),
          home: Home(),
        );
      },
    );
  }
}


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vatan_soft_case/app/common/controllers/home_controller.dart';
import 'package:vatan_soft_case/core/constants/font_constants.dart';
import 'package:vatan_soft_case/core/utils/custom_theme.dart';
import 'package:vatan_soft_case/core/utils/lang/translation_keys.dart' as translation;

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}
 // Dil Kısmı Denemek İçin Yapıldı Sonra Düzeltilecek.
class _SettingsState extends State<Settings> {
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                  translation.darkOrLightMode.tr,
                  style:FontConstants.kollektifMainRegular(color:Colors.grey)
              ),
              Center(
                child: ValueListenableBuilder(
                        valueListenable: Hive.box('settings').listenable(),
                        builder:(context, box, child) {
                          final isDark = box.get('isDark',defaultValue: false);
                          final isEnglish = box.get('isEnglish',defaultValue: false);
                          return  Switch(
                            value: isDark,
                            onChanged: (value) {
                              // Şu anda sayfayı yenileyince dil değişiyor neden olduğunu araştır.
                              box.put('isDark', value);
                              box.put('isEnglish', value);
                            },
                            activeColor: CustomTheme.darkThemeColor,
                          );
                        },
                      ),
              ),

            ],
          ),

        ],
      ),
    );
  }
}

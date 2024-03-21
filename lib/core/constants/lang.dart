import 'package:get/get.dart';

class Language extends Translations {
  final Map<String, Map<String, String>> languages;
  Language({required this.languages});

  @override
  Map<String, Map<String, String>> get keys {
    return languages;
  }
}
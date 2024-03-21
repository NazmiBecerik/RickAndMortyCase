import 'package:get/get.dart';
import 'package:vatan_soft_case/core/utils/lang/en.dart';
import 'package:vatan_soft_case/core/utils/lang/tr.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': En().messages,
    'tr_TR': Tr().messages,
  };
}
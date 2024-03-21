import 'package:get/get.dart';
import 'package:vatan_soft_case/core/models/character_model.dart';
import 'package:vatan_soft_case/core/models/info_model.dart';
import 'package:vatan_soft_case/core/utils/lang/translation_keys.dart' as translation;

class CharacterController extends GetxController{
  late List<Character> characterList = [];
  late Info? info ;
  int currentPage = 1 ;
  bool isAlive = false;
  void increaseCurrentPage () => currentPage ++ ;
  String filterQuery="";
  String filterName = "";
  String filterStatus = "";
  String filterSpecies = "";
  String filterType = "";
  String filterGender = "";
  List<String> genderList = ["",translation.male.tr,translation.female.tr,translation.genderless.tr,translation.unknown.tr];
  List<String> statusList = ["",translation.dead.tr,translation.alive.tr,translation.unknown.tr];
}
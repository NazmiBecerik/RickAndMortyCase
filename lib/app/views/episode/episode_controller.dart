import 'package:get/get.dart';
import 'package:vatan_soft_case/core/models/episode_model.dart';
import 'package:vatan_soft_case/core/models/info_model.dart';

class EpisodeController extends GetxController{
  late List<Episode> episodeList = [];
  late Info? info ;
  int currentPage = 0 ;
  void increaseCurrentPage () => currentPage ++ ;
}
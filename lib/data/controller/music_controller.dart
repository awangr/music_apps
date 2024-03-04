import 'package:get/get.dart';
import 'package:music_apps/data/model/music_model.dart';

class MusicController extends GetxController {
  final isplaying = false.obs;
  final isLoading = false.obs;
  RxList<Music> rxListmusic = AppMusic.listMusic.obs;
  RxList<Music> listMusic = <Music>[].obs;
  Future<void> delay() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 3));
    isLoading.value = false;
    // filteredNew;
  }
}

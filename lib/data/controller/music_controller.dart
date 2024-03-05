import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_apps/data/model/music_model.dart';

class MusicController extends GetxController {
  final isplaying = false.obs;
  final isLoading = false.obs;
  final player = AudioPlayer();
  RxList<Music> rxListmusic = AppMusic.listMusic.obs;
  RxList<Music> listMusic = <Music>[].obs;
  RxInt _currIndex = 0.obs;
  int get currIndex => _currIndex.value;
  List<Music> get listmusic2 => rxListmusic;
  RxList<Music> listCategory = <Music>[].obs;
  //Function
  Future<void> delay() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 3));
    isLoading.value = false;
    // filteredNew;
  }

  void play({int i = 0}) {
    isplaying.value = true;
    _currIndex.value = i;
    player.setFilePath(rxListmusic[currIndex].path);
    player.play();
  }

  void stop() {
    isplaying.value = false;
    player.stop();
  }

  void next() {
    if (currIndex < rxListmusic.length - 1) {
      _currIndex.value++;
      play();
    }
  }

  void previous() {
    if (currIndex > 0) {
      _currIndex.value--;
      play();
    }
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
}

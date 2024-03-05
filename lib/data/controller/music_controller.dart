import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_apps/data/model/music_model.dart';

class MusicController extends GetxController {
  final isplaying = false.obs;
  final isLoading = false.obs;
  final player = AudioPlayer();
  RxList<Music> rxListmusic = AppMusic.listMusic.obs;
  RxList<Music> listMusic = <Music>[].obs;
  RxInt playId = RxInt(-1);
  int get currIndex => playId.value;
  List<Music> get listmusic2 => rxListmusic;
  RxList<Music> listCategory = <Music>[].obs;
  //Function
  Future<void> delay() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 3));
    isLoading.value = false;
    // filteredNew;
  }

  @override
  void onInit() {
    player.playerStateStream.listen((event) {
      if (event.processingState == ProcessingState.completed) {
        if (playId.value < rxListmusic.length - 1) {
          playId.value++;
          next();
        } else {
          player.stop();
        }
      }
    });
    super.onInit();
  }

  void play(int id) async {
    final index = rxListmusic.indexWhere((music) => music.id == id);
    print('Indexxxxxxxxxxx ${index}');
    isplaying.value = true;
    if (index != -1) {
      playId.value = index;
      await player.setFilePath(rxListmusic[currIndex].path);
      player.play();
    }
    playId.value = id;
  }

  void stop() {
    isplaying.value = false;
    player.stop();
  }

  void next() {
    if (currIndex < rxListmusic.length - 1) {
      playId.value++;
      play(rxListmusic[currIndex].id);
    }
  }

  void previous() {
    if (currIndex > 0) {
      playId.value--;
      play(rxListmusic[currIndex].id);
    }
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
}

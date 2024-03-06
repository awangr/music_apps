import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_apps/data/model/music_model.dart';

class MusicController extends GetxController {
  RxList<Music> rxListmusic = AppMusic.listMusic.obs;
  RxList<Music> listGendre = AppGendre.listGendre.obs;
  RxBool _isplaying = false.obs;
  RxBool isLoading = false.obs;
  AudioPlayer player = AudioPlayer();
  RxInt playId = RxInt(0);
  bool get isPlaying => _isplaying.value;
  int get currIndex => playId.value;

  // //Function
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
          playId.value--;
        }
      }
    });
    super.onInit();
  }

  void play(int id) async {
    final index = rxListmusic.indexWhere((music) => music.id == id);
    print('Indexxxxxxxxxxx ${index}');
    //rxListmusic[id].isPlay = true;
    playId.value = index;
    player.play();

    //proses pengambilan data music dari file
    await player.setFilePath(rxListmusic[currIndex].path);
    _isplaying.value = true;
    // isplaying.value = false;
    playId.value = id;
  }

  void pause() {
    _isplaying.value = false;
    player.pause();
  }

  void next() {
    if (currIndex < rxListmusic.length /*- 1*/) {
      //playId.value++;
      rxListmusic.length > 1;
      play(rxListmusic[currIndex].id);
    } else {
      rxListmusic.length = 0;
    }
    //playId.value = 0;
  }

  void previous() {
    if (currIndex > 0) {
      rxListmusic.length < 1;
      play(rxListmusic[currIndex].id);
    }
    rxListmusic.length = playId.value;
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
}

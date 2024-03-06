import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_apps/data/model/music_model.dart';

class MusicController extends GetxController {
  RxBool _isplaying = false.obs;
  bool get isPlaying => _isplaying.value;
  final isLoading = false.obs;
  Duration lastPosition = Duration.zero;
  final player = AudioPlayer();
  RxList<Music> rxListmusic = AppMusic.listMusic.obs;
  RxList<Music> listMusic = <Music>[].obs;
  RxInt playId = RxInt(0);
  int get currIndex => playId.value;
  List<Music> get listmusic2 => rxListmusic;
  RxList<Music> listCategory = <Music>[].obs;
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
    rxListmusic[id].isPlay = true;
    playId.value = index;
    player.play();
    player.seek(lastPosition);

    //proses pengambilan data music dari file
    await player.setFilePath(rxListmusic[currIndex].path);
    _isplaying.value = true;
    // isplaying.value = false;
    playId.value = id;
  }

  void pause() {
    _isplaying.value = false;
    player.pause();
    lastPosition = player.position;
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
  // AudioPlayer player = AudioPlayer();
  // //////////////////// Variable Getx  ////////////////////////
  // RxList<Music> _listMusics = AppMusic.listMusic.obs;
  // RxBool _isPlaying = false.obs;
  // RxInt _currentSongIndex = 0.obs;
  // Rx<Duration> _position = Duration().obs;
  // Rx<Duration> _duration = Duration().obs;
  // //////////////////   Getx ke biasa  ////////////////////////
  // List get listMusics => _listMusics;
  // bool get isPlaying => _isPlaying.value;
  // int get currentSongIndex => _currentSongIndex.value;
  // Duration get position => _position.value;
  // Duration get duration => _duration.value;
  // @override
  // void onInit() {
  //   super.onInit();
  //   player.durationStream.listen((d) {
  //     _duration.value = d!;
  //   });
  //   player.durationStream.listen((p) {
  //     _position.value = p!;
  //   });
  // }

  // void playMusic(int id) async {
  //   final index = rxListmusic.indexWhere((music) => music.id == id);
  //   await player.setFilePath(_listMusics[currentSongIndex].path);
  //   _isPlaying.value = true;
  //   _currentSongIndex.value = index;
  //   _currentSongIndex.value = id;
  // }

  // void pauseMusic() {
  //   player.pause();
  //   _isPlaying.value = false;
  // }

  // void stopMusic() {
  //   player.stop();
  //   _isPlaying.value = false;
  // }

  // void nextMusic() {
  //   if (currentSongIndex < _listMusics.length - 1) {
  //     _currentSongIndex.value++;
  //     playMusic(_listMusics[currentSongIndex].id);
  //   }
  // }

  // void previousMusic() {
  //   if (currentSongIndex > 0) {
  //     _currentSongIndex.value--;
  //   }
  //   playMusic(_listMusics[currentSongIndex].id);
  // }

  // void seekMusic(int second) {
  //   Duration newDuration = Duration(seconds: second);
  //   player.seek(newDuration);
  // }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_apps/data/model/music_model.dart';

class MusicController extends GetxController {
  RxList<Music> rxListmusic = AppMusic.listMusic.obs;
  RxList<Music> listGendre = AppGendre.listGendre.obs;

  RxBool _isplaying = false.obs;
  RxBool isLoading = false.obs;
  BuildContext? context;
  AudioPlayer player = AudioPlayer();
  RxInt playId = RxInt(0);
  bool get isPlaying => _isplaying.value;
  int get currIndex => playId.value;

  // //Function
  Future<List<Music>?> delay() async {
    // filteredNew;
    isLoading.value = true;
    return await Future.delayed(Duration(seconds: 1));
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
    if (!isPlaying) {
      rxListmusic[currIndex].id = id;
      rxListmusic[currIndex].isPlay = true;
      await player.setFilePath(rxListmusic[currIndex].path);
      final index = rxListmusic.indexWhere((music) => music.id == id);
      print('Indexxxxxxxxxxx ${index}');
      //playId.value = index;
      player.play();

      //proses pengambilan data music dari file
      _isplaying.value = true;
      // isplaying.value = false;
      playId.value = id;
    } else {
      pause();
    }
  }

  void pause() {
    rxListmusic[currIndex].isPlay = false;
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

  showBottomNav() {
    if (_isplaying.value || rxListmusic[currIndex].isPlay == true) {
      play(rxListmusic[currIndex].id);
      return Padding(
        padding: EdgeInsets.only(right: 10, left: 10, bottom: 5),
        child: Card(
          elevation: 9,
          child: Container(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.amber,
                  ),
                  Text('data'),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_back),
                      Icon(Icons.play_arrow),
                      Icon(Icons.arrow_forward)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      rxListmusic[currIndex].isPlay = false;
      SizedBox();
    }
  }
}

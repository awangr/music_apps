import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_apps/data/controller/music_controller.dart';
import 'package:music_apps/data/model/music_model.dart';
import 'package:blurrycontainer/blurrycontainer.dart';

final controller = Get.put(MusicController());

class ListGendre extends StatefulWidget {
  const ListGendre({super.key, required this.gendre});
  final List<Music> gendre;

  @override
  State<ListGendre> createState() => _ListGendreState();
}

class _ListGendreState extends State<ListGendre> {
  final String text = '''
aaaaaaaa
bbbbbbbb
cccccccc''';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.gendre.length,
        itemBuilder: (context, index) {
          Music musics = widget.gendre[index];
          //for gendre
          final gendreVal = Gendre.values[index];
          final enumGender = Music.enumToString(gendreVal);
          return Container(
            child: Column(
              children: [
                Container(
                  width: Get.width,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      image: DecorationImage(
                          image: AssetImage(musics.image), fit: BoxFit.cover)),
                ),
                BlurryContainer(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: musics.color
                        .withOpacity(0.8), //Colors.white.withOpacity(0.4),
                    width: Get.width,
                    height: 50,
                    child: Text(
                      '${enumGender}',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 243,
            width: 168,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(blurRadius: 4, offset: Offset(4, 7))],
                borderRadius: BorderRadius.circular(20)),
          );
        },
      ),
    );
  }
}

class TopAlbum extends StatefulWidget {
  const TopAlbum({super.key, required this.music});
  final List<Music> music;
  @override
  State<TopAlbum> createState() => _TopAlbumState();
}

class _TopAlbumState extends State<TopAlbum> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.music.length,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 9 / 4,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        Music musics = widget.music[index];
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            elevation: 7,
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              onTap: () {
                //controller.showBottomNav();
                if (!controller.isPlaying) {
                  controller.play(musics.id);
                } else {
                  controller.pause();
                }
              },
              subtitle: Text(musics.penyanyi),
              trailing: Icon(controller.isPlaying ||
                      controller.rxListmusic[controller.currIndex].isPlay ==
                          true
                  ? Icons.pause
                  : Icons.play_arrow),
              leading: CircleAvatar(
                backgroundImage: AssetImage(musics.image),
              ),
              title: Text(musics.judul),
            ),
          ),
        );
      },
    ); //ListView.builder(
    //   shrinkWrap: true,
    //   itemCount: widget.music.length,
    //   itemBuilder: (context, index) {
    //     Music musics = widget.music[index];
    //     return Column(
    //       children: [
    //         Card(
    //           elevation: 6,
    //           child: ListTile(
    //             onTap: () {
    //               // showModalBottomSheet(
    //               //   context: context,
    //               //   builder: (context) {
    //               //     return Container(
    //               //       width: Get.width,
    //               //       height: 100,
    //               //       color: Colors.amber,
    //               //       child: Text('${controller}'),
    //               //     );
    //               //   },
    //               // );
    //               // if (controller.isPlaying) {
    //               //   controller.pause();
    //               // } else {
    //               //   controller.play(musics.id);
    //               // }
    //             },
    //             leading: CircleAvatar(
    //               backgroundImage: AssetImage(musics.image),
    //             ),
    //             title: Text(
    //               musics.judul,
    //               style: TextStyle(color: Colors.black),
    //             ),
    //             subtitle: Text(musics.penyanyi),
    //           ),
    //         ),
    //       ],
    //     );
    //   },
    // );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_apps/data/controller/music_controller.dart';
import 'package:music_apps/data/model/music_model.dart';

final controller = Get.put(MusicController());

class TopAlbum extends StatefulWidget {
  const TopAlbum({super.key, required this.music});
  final List<Music> music;
  @override
  State<TopAlbum> createState() => _TopAlbumState();
}

class _TopAlbumState extends State<TopAlbum> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.music.length,
      itemBuilder: (context, index) {
        Music musics = widget.music[index];
        print(musics.judul);
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(musics.image),
          ),
          // leading: Container(
          //   width: 60,
          //   height: 60,
          //   child: Image.asset(musics.image),
          // ),
          title: Text(
            musics.penyanyi,
            style: TextStyle(color: Colors.black),
          ),
        );
      },
    );
  }
}

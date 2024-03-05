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
        return Card(
          elevation: 6,
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(musics.image),
            ),
            title: Text(
              musics.judul,
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(musics.penyanyi),
            trailing: IconButton(
                onPressed: () {
                  if (controller.isplaying.value) {
                    controller.stop();
                  } else {
                    controller.play();
                  }
                },
                icon: Obx(() => Icon(controller.isplaying.value
                    ? Icons.stop
                    : Icons.play_arrow))),
          ),
        );
      },
    );
  }
}

class ListCategory extends StatefulWidget {
  const ListCategory({super.key, required this.category});
  final List<Music> category;

  @override
  State<ListCategory> createState() => _ListCategoryState();
}

class _ListCategoryState extends State<ListCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.category.length,
        itemBuilder: (context, index) {
          Music category = widget.category[index];
          return Container(
            child: Column(
              children: [
                Container(
                  width: Get.width,
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(category.image),
                          fit: BoxFit.cover)),
                ),
                Container(
                  width: Get.width,
                  height: 50,
                  color: Colors.grey.withOpacity(0.1),
                )
              ],
            ),
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 243,
            width: 168,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 4,
                  offset: Offset(4, 7))
            ], borderRadius: BorderRadius.circular(20), color: Colors.amber),
          );
        },
      ),
    );
  }
}

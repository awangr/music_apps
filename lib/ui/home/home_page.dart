import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_apps/data/controller/music_controller.dart';
import 'package:music_apps/ui/passing/top_album.dart';

final controller = Get.put(MusicController());

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Player'),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.list)),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: FutureBuilder(
        future: controller.delay(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return GetBuilder(
              builder: (MusicController musicC) {
                return TopAlbum(
                  music: controller.rxListmusic,
                );
              },
            );
          }
        },
      ),
    );
  }
}

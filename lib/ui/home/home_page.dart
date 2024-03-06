import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_apps/data/controller/music_controller.dart';
import 'package:music_apps/ui/passing/home_pass.dart';

final controller = Get.put(MusicController());

enum gendre { All, Hiphop, Jazz, Pop, Dangdut }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              title: Text('data'),
            ),
            ListTile(title: Text('data')),
            ListTile(title: Text('data')),
            ListTile(title: Text('data'))
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Music Player'),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder(
                builder: (MusicController controller) {
                  return ListCategory(
                    category: controller.rxListmusic,
                  );
                },
              ),
              SizedBox(height: 15),
              Text(
                'Top Albums',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
              SizedBox(height: 20),
              FutureBuilder(
                future: controller.delay(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return GetBuilder(
                      builder: (MusicController musicC) {
                        return TopAlbum(music: controller.rxListmusic);
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

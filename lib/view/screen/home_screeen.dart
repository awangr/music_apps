import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_apps/common/style/app_asset.dart';
import 'package:music_apps/common/style/app_color.dart';

import '../../common/widget/carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ListView(
            children: [
              SizedBox(height: 10),
              CarouselWidget(),
              SizedBox(height: 15),
              SmothPage(),
              SizedBox(height: 20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Favorite Song',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text('See all', style: TextStyle(color: Colors.white))
                  ],
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppAsset.slide),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.amber),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: 108,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Judul',
                            style: TextStyle(color: white),
                          ),
                          Text('Tahun', style: TextStyle(color: white))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child:
                    SizedBox(height: 1, child: Drawer(backgroundColor: orange)),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Sing',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Get.height,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Card(
                      color: transparant,
                      elevation: 5,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/slider/home.png'),
                          backgroundColor: orange,
                        ),
                        trailing: Icon(Icons.menu),
                        title: Text(
                          'Penyanyi',
                          style: TextStyle(
                              color: white, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('Tahun * Judul'),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}

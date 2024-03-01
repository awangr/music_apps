import 'package:flutter/material.dart';
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
        body: ListView(
          children: [
            CarouselWidget(),
            SizedBox(
              height: 50,
            ),
            SmothPage()
          ],
        ));
  }
}

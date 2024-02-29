import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:music_apps/common/style/app_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height / 0.5;
    return Scaffold(
        backgroundColor: black,
        body: Container(
          height: height * 0.22,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/home.png'),
                //fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.black45, BlendMode.darken)),
          ),
        ));
  }
}

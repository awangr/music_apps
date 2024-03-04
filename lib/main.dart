import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

import 'ui/home/home_page.dart';

void main() {
  // AssetsAudioPlayer.addNotificationOpenAction((notification) {
  //   return true;
  // });
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: ScrollBehavior().copyWith(
          dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse}),
      home: HomePage(),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_apps/common/style/app_color.dart';
import 'package:music_apps/common/widget/bg_image.dart';
import 'package:music_apps/view/screen/salomon_screen.dart';

import '../../common/style/app_textstyle.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          BgImage(),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 2.0),
                child: Container(
                  // the size where the blurring starts
                  height: MediaQuery.of(context).size.height * 0.4,
                  color: Colors.black26.withOpacity(0.2),
                ),
              ),
            ),
          ),
          body,
        ],
      ),
    );
  }
}

Widget get body {
  return Scaffold(
    backgroundColor: transparant,
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: 250,
          child: Text(
            'Dancing between The shadows \nOf rhythm ',
            maxLines: 3,
            textAlign: TextAlign.start,
            style: fontTitle,
          ),
        ),
        SizedBox(height: 60),
        Center(
            child: SizedBox(
                width: 165,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(orange)),
                    onPressed: () {
                      Get.to(BottomScreen());
                    },
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )))),
        SizedBox(height: 25),
        Center(
          child: Container(
            width: 220,
            child: Text(
              'by continuing you agree to terms of services and  Privacy policy',
              style: TextStyle(color: grey),
            ),
          ),
        ),
      ],
    ),
  );
}

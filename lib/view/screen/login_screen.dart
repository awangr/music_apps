import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:music_apps/common/style/app_color.dart';
import 'package:music_apps/common/widget/bg_image.dart';

import '../../common/style/app_textstyle.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          BgImage(),
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
                    onPressed: () {},
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
              //textAlign: TextAlign.center,
              style: TextStyle(color: grey),
            ),
          ),
        ),
      ],
    ),
  );
}

import 'package:flutter/material.dart';

class BgImage extends StatelessWidget {
  const BgImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(colors: [
        Colors.white,
        Colors.black12,
      ], begin: Alignment.topCenter, end: Alignment.bottomRight)
          .createShader(bounds),
      blendMode: BlendMode.darken,
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black38,
                  blurRadius: 5.0,
                  offset: Offset(2, 2),
                  spreadRadius: 7)
            ],
            image: DecorationImage(
                image: AssetImage('assets/background/bg.png'),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.black12, BlendMode.darken))),
      ),
    );
  }
}

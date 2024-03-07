import 'package:flutter/material.dart';
import 'package:music_apps/data/const/app_asset.dart';

enum Gendre { Pop, Jazz, Rock }

class Music {
  int id;
  String judul;
  String penyanyi;
  String image;
  Gendre gendre;
  String path;
  Color color;
  bool isPlay;

  Music(this.id, this.judul, this.penyanyi, this.image, this.path, this.color,
      this.gendre, this.isPlay);
  static String enumToString(Gendre gendre) {
    switch (gendre) {
      case Gendre.Pop:
        return 'Pop';
      case Gendre.Jazz:
        return 'Jazz';
      case Gendre.Rock:
        return 'Rock';
      default:
        return 'Unknow';
    }
  }
}

class AppMusic {
  static List<Music> listMusic = [
    //
    Music(1, 'Always', 'Bon jovi', '${AppAsset.bon}', '${AppAsset.always}',
        Colors.white, Gendre.Pop, false),
    //
    Music(2, 'Bad Liar', 'Imagine', '${AppAsset.bad}', '${AppAsset.badliar}',
        Colors.white, Gendre.Jazz, false), //
    Music(3, 'Demi Cinta', 'Krispatih', '${AppAsset.kris}',
        '${AppAsset.demicinta}', Colors.white, Gendre.Rock, false), //
    Music(4, 'Reckless ', 'Madison ', '${AppAsset.madi}', '${AppAsset.madison}',
        Colors.white, Gendre.Pop, false), //
    Music(5, 'Percaya', 'Afgan', '${AppAsset.afgan}', '${AppAsset.percaya}',
        Colors.white, Gendre.Pop, false), //
    Music(6, 'Lovely', 'Billie ', AppAsset.bill, AppAsset.lovely, Colors.white,
        Gendre.Pop, false)
  ];
}

class AppGendre {
  static List<Music> listGendre = [
    Music(0, '', '', AppAsset.pop, '', Colors.amber, Gendre.Pop, false),
    Music(0, '', '', AppAsset.jazz, '', Colors.red, Gendre.Jazz, false),
    Music(0, '', '', AppAsset.rock, '', Colors.greenAccent, Gendre.Rock, false),
  ];
}

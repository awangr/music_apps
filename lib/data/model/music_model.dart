import 'package:flutter/material.dart';
import 'package:music_apps/data/const/app_asset.dart';

enum Gendre { Hiphop, Jazz, Pop }

class Music {
  int id;
  String judul;
  String penyanyi;
  String image;
  Gendre gendre;
  String path;
  Color color;

  Music(this.id, this.judul, this.penyanyi, this.image, this.path, this.color,
      this.gendre);
  static String enumToString(Gendre gendre) {
    switch (gendre) {
      case Gendre.Hiphop:
        return 'HipHop';
      case Gendre.Pop:
        return 'Pop';
      case Gendre.Jazz:
        return 'Jazz';
      default:
        return 'Unknow';
    }
  }
}

class AppMusic {
  static List<Music> listMusic = [
    Music(1, 'Always', 'Bon jovi', '${AppAsset.bon}', '${AppAsset.always}',
        Colors.white, Gendre.Pop),
    Music(2, 'Bad Liar', 'Imagine', '${AppAsset.bad}', '${AppAsset.badliar}',
        Colors.white, Gendre.Jazz),
    Music(3, 'Demi Cinta', 'Krispatih', '${AppAsset.kris}',
        '${AppAsset.demicinta}', Colors.white, Gendre.Hiphop),
    Music(4, 'Reckless ', 'Madison ', '${AppAsset.madi}', '${AppAsset.madison}',
        Colors.white, Gendre.Pop),
    Music(5, 'Percaya', 'Afgan', '${AppAsset.afgan}', '${AppAsset.percaya}',
        Colors.white, Gendre.Pop),
    Music(6, 'Lovely', 'Billie ', AppAsset.bill, AppAsset.lovely, Colors.white,
        Gendre.Pop)
  ];
}

class AppGendre {
  static List<Music> listGendre = [
    Music(0, '', '', AppAsset.pop, '', Colors.white, Gendre.Pop),
    Music(0, '', '', AppAsset.jazz, '', Colors.white, Gendre.Jazz),
    Music(0, '', '', AppAsset.rock, '', Colors.white, Gendre.Hiphop),
    Music(0, '', '', AppAsset.madi, '', Colors.white, Gendre.Pop)
  ];
}

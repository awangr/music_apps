import 'package:flutter/material.dart';
import 'package:music_apps/data/const/app_asset.dart';

class Music {
  int id;
  String judul;
  String penyanyi;
  String image;
  String path;
  Color color;
  bool isPlay;
  Music(this.id, this.judul, this.penyanyi, this.image, this.path, this.color,
      {this.isPlay = false});
}

class AppMusic {
  static List<Music> listMusic = [
    Music(1, 'Always', 'Bon jovi', '${AppAsset.bon}', '${AppAsset.always}',
        Colors.white),
    Music(2, 'Bad Liar', 'Imagenie Dragon', '${AppAsset.bad}',
        '${AppAsset.badliar}', Colors.white),
    Music(3, 'Demi Cinta', 'Krispatih', '${AppAsset.kris}',
        '${AppAsset.demicinta}', Colors.white),
    Music(4, 'Reckless ', 'Madison Beer', '${AppAsset.madi}',
        '${AppAsset.madison}', Colors.white),
    Music(5, 'Percaya', 'Afgan', '${AppAsset.afgan}', '${AppAsset.percaya}',
        Colors.white)
  ];
}

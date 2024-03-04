import 'package:flutter/material.dart';
import 'package:music_apps/data/const/app_asset.dart';

class Music {
  String judul;
  String penyanyi;
  String image;
  String path;
  Color color;
  Music(this.judul, this.penyanyi, this.image, this.path, this.color);
}

class AppMusic {
  static List<Music> listMusic = [
    Music('Always', 'Bon jovi', '${AppAsset.bon}', '${AppAsset.always}',
        Colors.white),
    Music('Bad Liar', 'Imagenie Dragon', '${AppAsset.bad}',
        '${AppAsset.badliar}', Colors.white),
    Music('Demi Cinta', 'Krispatih', '${AppAsset.kris}',
        '${AppAsset.demicinta}', Colors.white),
    Music('Reckless ', 'Madison Beer', '${AppAsset.madi}',
        '${AppAsset.madison}', Colors.white),
    Music('Percaya', 'Afgan', '${AppAsset.afgan}', '${AppAsset.percaya}',
        Colors.white)
  ];
}

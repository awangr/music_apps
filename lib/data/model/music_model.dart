import 'package:music_apps/data/const/app_asset.dart';

class Music {
  String judul;
  String penyanyi;
  String image;
  String path;
  Music(this.judul, this.penyanyi, this.image, this.path);
}

List<Music> listMusic = [
  Music('Always', 'Bon jovi', '${AppAsset.bon}', '${AppAsset.always}'),
  Music(
      'Bad Liar', 'Imagenie Dragon', '${AppAsset.bad}', '${AppAsset.badliar}'),
  Music('Demi Cinta', 'Krispatih', '${AppAsset.kris}', '${AppAsset.demicinta}'),
  Music('Reckless ', 'Madison Beer', '${AppAsset.madi}', '${AppAsset.madison}'),
  Music('Percaya', 'Afgan', '${AppAsset.afgan}', '${AppAsset.percaya}')
];

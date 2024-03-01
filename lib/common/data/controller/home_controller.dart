import 'package:get/get.dart';

import '../../style/app_asset.dart';

class HomeController extends GetxController {
  //final pageC = PageController(initialPage: 0);
  final notchBarC = 0.obs;
  var currentSlide = 0.obs;
  RxList<String> listSlider =
      [AppAsset.slide, AppAsset.slide, AppAsset.slide].obs;
  var currentBottomIndex = 0.obs;
  void switchBottomNav(int index) {
    currentBottomIndex.value = index;
    print(index.toString());
  }
}

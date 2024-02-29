import 'package:get/get.dart';

class HomeController extends GetxController {
  //final pageC = PageController(initialPage: 0);
  final notchBarC = 0.obs;
  var currentBottomIndex = 0.obs;
  void switchBottomNav(int index) {
    currentBottomIndex.value = index;
    print(index.toString());
  }
}

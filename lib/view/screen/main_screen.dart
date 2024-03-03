import 'package:flutter/material.dart';
import 'package:music_apps/common/data/controller/home_controller.dart';
import 'package:music_apps/common/data/models/bottom_model.dart';
import 'package:music_apps/common/widget/page_transition.dart';
import 'package:music_apps/view/screen/search_screen.dart';
import 'package:get/get.dart';
import 'fav_screen.dart';
import 'home_screeen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:music_apps/common/style/app_color.dart';

final controller = HomeController();

class BottomScreen extends StatelessWidget {
  final List<Widget> listPage = [
    const HomeScreen(),
    const SearchScreen(),
    const FavScreen(),
  ];
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => PageTransition(
            child: listPage[controller.currentBottomIndex.value])),
        bottomNavigationBar: salomon());
  }

  ///BOTTOM NAVBAR
  Obx salomon() {
    return Obx(() {
      return SalomonBottomBar(
          unselectedItemColor: Colors.white,
          selectedItemColor: orange,
          backgroundColor: black,
          onTap: controller.switchBottomNav,
          currentIndex: controller.currentBottomIndex.value,
          items: DataBottomModel.listBottomModel
              .map((e) => SalomonBottomBarItem(
                  icon: e.activeIcon,
                  activeIcon: e.nonActiveIcon,
                  title: Text('${e.label}')))
              .toList());
    });
  }
}

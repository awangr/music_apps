import 'package:flutter/material.dart';
import 'package:music_apps/common/data/controller/home_controller.dart';
import 'package:music_apps/common/data/models/bottom_model.dart';
import 'package:music_apps/common/widget/page_transition.dart';
import 'package:music_apps/view/screen/library_screen.dart';
import 'package:music_apps/view/screen/search_screen.dart';
import 'package:get/get.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'home_screeen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

final controller = HomeController();

class BottomScreen extends StatelessWidget {
  final List<Widget> listPage = [
    const SearchScreen(),
    const HomeScreen(),
    const LibraryScreen(),
  ];
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => PageTransition(
            child: listPage[controller.currentBottomIndex.value])),
        bottomNavigationBar: Obx(() {
          return SalomonBottomBar(
              onTap: controller.switchBottomNav,
              currentIndex: controller.currentBottomIndex.value,
              items: DataBottomModel.listBottomModel
                  .map((e) => SalomonBottomBarItem(
                      icon: e.activeIcon,
                      activeIcon: e.nonActiveIcon,
                      title: Text('${e.label}')))
                  .toList());
        })
        /* ConvexAppBar(
            onTap: controller.switchBottomNav,
            initialActiveIndex: controller.currentBottomIndex.value,
            items: DataBottomModel.listBottomModel
                .map((e) =>
                    TabItem(icon: e.nonActiveIcon, activeIcon: e.activeIcon))
                .toList())*/
        );
  }
}

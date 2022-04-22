import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallawashtest/models/menu_model.dart';
import '../constants/app_constants.dart';

class BottomNavController extends GetxController {
  int initialIndex = 0;

  void jumpToPage(int index) async {
    closeDrawer();
    initialIndex = index;
    update();
  }

  List<Widget> myBottomNavRoute = [...allMenuList.map((e) => e.screen)];

  List<String> appBarTitles = [...allMenuList.map((e) => e.text)];

  final iconList = <IconData>[
    Icons.home_filled,
    Icons.search,
    Icons.car_rental_outlined,
    Icons.person,
  ];

  AnimatedBottomNavigationBar buildAnimatedBottomNavigationBar(
      BuildContext context) {
    return AnimatedBottomNavigationBar(
      height: Get.height * 0.12,
      elevation: 20,
      activeColor: Theme.of(context).primaryColor,
      icons: iconList,
      iconSize: AppConstants.defaultFont,
      inactiveColor: Theme.of(context).bottomAppBarColor,
      activeIndex: initialIndex,
      gapLocation: GapLocation.center,
      splashColor: Colors.blue,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      leftCornerRadius: 22,
      rightCornerRadius: 22,
      onTap: (int index) {
        initialIndex = index;
        update();
      },
    );
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer() async {
    scaffoldKey.currentState?.openEndDrawer();
  }
}

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_constants.dart';

class BottomNavController extends GetxController {
  int _initialIndex = 0;
  final iconList = <IconData>[
    Icons.home_filled,
    Icons.search,
    Icons.car_rental_outlined,
    Icons.person,
  ];

  AnimatedBottomNavigationBar buildAnimatedBottomNavigationBar(BuildContext context) {
    return AnimatedBottomNavigationBar(
      height: Get.height * 0.12,
      elevation: 20,
      activeColor: Theme.of(context).primaryColor,
      icons: iconList,
      iconSize: AppConstants.defaultFont,
      inactiveColor: Colors.grey.shade400,
      activeIndex: _initialIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      leftCornerRadius: 22,
      rightCornerRadius: 22,
      onTap: (int index) {
        _initialIndex = index;
        update();
      },
    );
  }
}

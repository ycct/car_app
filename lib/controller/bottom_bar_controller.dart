import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallawashtest/screens/profile_screen/profile_screen.dart';
import 'package:yallawashtest/screens/search_screen/search_screen.dart';
import 'package:yallawashtest/screens/service_screen/service_screen.dart';
import '../constants/app_constants.dart';
import '../screens/home_screen/home_screen.dart';

class BottomNavController extends GetxController {
  int initialIndex = 0;

  List<Widget> myBottomNavRoute = [
    const HomeScreen(),
    const SearchScreen(),
    const ServiceScreen(),
    const ProfileScreen(),
  ];

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
      inactiveColor: Colors.grey.shade400,
      activeIndex: initialIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      leftCornerRadius: 22,
      rightCornerRadius: 22,
      onTap: (int index) {
        initialIndex = index;
        update();
      },
    );
  }
}

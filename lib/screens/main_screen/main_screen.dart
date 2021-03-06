import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/bottom_bar_controller.dart';
import '../home_screen/components/components.dart';
import '../../widgets/navigation_drawer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (BottomNavController bottomNavController) {
      return Scaffold(
        key: Get.find<BottomNavController>().scaffoldKey,
        drawer:  NavigationDrawer(title:"jane".tr,location: "location".tr, ),
        appBar: buildAppBar(
          context,
          onTap: () {
            bottomNavController.openDrawer();
          },
          title: bottomNavController.appBarTitles[bottomNavController.initialIndex],
          widget: bottomNavController.initialIndex == 0
              ? buildCircleAvatar(context)
              : const SizedBox(),
        ),
        floatingActionButton: buildFloating(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar:
        bottomNavController.buildAnimatedBottomNavigationBar(context),
        body: bottomNavController
            .myBottomNavRoute[bottomNavController.initialIndex],
      );
    });
  }
}
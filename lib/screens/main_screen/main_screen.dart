import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/bottom_bar_controller.dart';
import '../home_screen/components/components.dart';
import 'components/navigation_drawer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return GetBuilder(builder: (BottomNavController bottomNavController) {
      return Scaffold(
        key: _scaffoldKey,
        drawer: const NavigationDrawer(),
        appBar: buildAppBar(
          context,
          onTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          title:
              bottomNavController.routeNames[bottomNavController.initialIndex],
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

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../controller/bottom_bar_controller.dart';
import '../home_screen/components/components.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (BottomNavController bottomNavController) {
        return Scaffold(
          floatingActionButton: buildFloating(context),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: bottomNavController.buildAnimatedBottomNavigationBar(context),
          body: bottomNavController.myBottomNavRoute[bottomNavController.initialIndex],
        );
      }
    );
  }
}

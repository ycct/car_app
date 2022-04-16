import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:yallawashtest/screens/home_screen/home_screen.dart';
import 'package:yallawashtest/screens/profile_screen/profile_screen.dart';
import 'package:yallawashtest/screens/settings_screen/settings_screen.dart';
import '../screens/my_products_screen/my_products_screen.dart';
import '../screens/offers_screen/offers_screen.dart';
import '../screens/remaining_deals_screen/remaining_deals_screen.dart';
import '../screens/signout_screen/signout_screen.dart';

class MenuModel {
  final String text;
  final IconData iconData;
  final Widget screen;
  final int index;

  const MenuModel(this.text, this.iconData, this.screen, this.index);
}

final List<MenuModel> allMenuList = [
  menuHomeScreen,
  menuOfferScreen,
  menuMyProductsScreen,
  menuProfileScreen,
  menuRemainingDealsScreen,
  menuSettingsScreen,
  menuSignOut,
  menuJoinTheApp,
];

final MenuModel menuHomeScreen = MenuModel(
  "menu.home".tr,
  Icons.home_outlined,
  const HomeScreen(),
  0
);

final MenuModel menuOfferScreen = MenuModel(
  "menu.offers".tr,
  Icons.poll_outlined,
  const OfferScreen(),
  1
);


final MenuModel menuMyProductsScreen = MenuModel(
  "menu.myProducts".tr,
  Icons.production_quantity_limits,
  const MyProductsScreen(),
  2
);
final MenuModel menuProfileScreen = MenuModel(
    "menu.profile".tr,
    Icons.person_outline_outlined,
    const ProfileScreen(),
    3
);


final MenuModel menuRemainingDealsScreen = MenuModel(
  "menu.remainingDeals".tr,
  Icons.access_time_rounded,
  const RemainingDealsScreen(),
  4
);

final MenuModel menuSettingsScreen = MenuModel(
  "menu.settings".tr,
  Icons.settings_outlined,
  const SettingsScreen(),
  5
);

final MenuModel menuSignOut = MenuModel(
  "menu.signOut".tr,
  Icons.logout,
  const SignOutScreen(),
  6
);
final MenuModel menuJoinTheApp = MenuModel(
  "menu.joinTheApp".tr,
  Icons.favorite_border_outlined,
  const SettingsScreen(),
  7
);

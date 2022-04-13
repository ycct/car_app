import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallawashtest/screens/settings_screen/edit_add_screens/my_addresses_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarForSecondScreens(context, title: Get.currentRoute.tr, leading: "cancel".tr),
    );
  }
}

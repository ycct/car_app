import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallawashtest/extensions.dart';
import 'package:yallawashtest/screens/settings_screen/edit_add_screens/my_addresses_screen.dart';
import 'package:yallawashtest/screens/settings_screen/edit_add_screens/update_mail_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarForSecondScreens(context, title: Get.currentRoute.tr, leading: "cancel".tr),
        body: Padding(
          padding:  EdgeInsets.symmetric(vertical: context.paddingDefaultHeight),
          child: ListView(children: [
            buildCard(context,title: "currentPassword".tr),
            buildCard(context, title: "newPassword".tr),
            buildCard(context,title: "confirmPassword".tr),
          ]),
        )

    );

  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallawashtest/extensions.dart';
import 'package:yallawashtest/screens/settings_screen/edit_add_screens/my_addresses_screen.dart';
import '../../../constants/app_constants.dart';

class UpdateMailScreen extends StatelessWidget {
  const UpdateMailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarForSecondScreens(context,
          title: Get.currentRoute.tr, leading: "cancel".tr),
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: context.paddingDefaultHeight),
        child: ListView(children: [
          buildCard(context,title: "newMail".tr),
          buildCard(context, title: "confirmMail".tr),
          buildCard(context,title: "password".tr),
        ]),
      ),
    );
  }

}
Card buildCard(BuildContext context,{String? title}) {
  return Card(
    elevation: 0,
    child: TextFormField(

        decoration: InputDecoration(
          contentPadding:  const EdgeInsets.symmetric(
            horizontal: AppConstants.defaultPadding,
          ),
          labelText: title??"",
          labelStyle: TextStyle(color: Theme.of(context).primaryColorLight),
          fillColor: Theme.of(context).disabledColor,
        )

    ),
  );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallawashtest/extensions.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: context.paddingDefaultHeight),
        child: ListView(
          children: [
            buildTextIconRow(context, title: 'accInfo'.tr),
            buildTextIconRow(context, title: "savedAddresses".tr, routeName: "/myAddresses"),
            buildTextIconRow(context, title: "resetPass".tr, routeName: "/resetPassword"),
            buildTextIconRow(context, title: "updateMail".tr, routeName: "/updateMail"),
            context.sizedBoxHeightSmall,
            buildTextSwitchRow(
              context,
              title: 'notifications'.tr,
              value: true,
            ),
            context.sizedBoxHeightSmall,
            buildTextSwitchRow(
              context,
              title: 'language'.tr,value: false
            ),
            buildTextIconRow(context, title: "city".tr, contentText: "Sharjah",routeName: "/selectEmirate"),
            context.sizedBoxHeightSmall,
            buildTextIconRow(context, title: "invite".tr),
            buildTextIconRow(context, title: "about".tr),
            context.sizedBoxHeightSmall,
            buildTextIconRow(context, title: "signOut".tr),
          ],
        ),
      ),
    );
  }

  Widget buildTextIconRow(BuildContext context,
      {required String title, String? contentText, VoidCallback? onTap,String? routeName}) {
    return InkWell(
      onTap: (){Get.toNamed(routeName??"");},
      child: SizedBox(
        width: double.infinity,
        height: context.dynamicHeight(0.06),
        child: Card(
          elevation: 1,
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: context.paddingSmallWidth),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Row(
                  children: [
                    Text(
                      contentText ?? "",
                      style: TextStyle(
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                    const Icon(Icons.arrow_forward_rounded),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildTextSwitchRow(BuildContext context, {required String title, bool? value}) {
    return SizedBox(
      width: double.infinity,
      height: context.dynamicHeight(0.06),
      child: Card(
        elevation: 1,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.paddingSmallWidth),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Transform.scale(
                scale: 0.7,
                child: SizedBox(
                  width: context.paddingExtraLargeWidth,
                  child: CupertinoSwitch(activeColor: Theme.of(context).primaryColor,
                    value: value??false,
                    onChanged: (_) {},
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

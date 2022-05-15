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
            buildTextIconRow(context,
                title: 'accInfo'.tr, routeName: "/settings"),
            buildTextIconRow(context,
                title: "savedAddresses".tr, routeName: "/myAddresses"),
            buildTextIconRow(context,
                title: "resetPass".tr, routeName: "/resetPassword"),
            buildTextIconRow(context,
                title: "updateMail".tr, routeName: "/updateMail"),
            context.sizedBoxHeightSmall,
            buildTextSwitchRow(
              context,
              title: 'notifications'.tr,
              value: true,
            ),
            context.sizedBoxHeightSmall,
            buildTextSwitchRow(context, title: 'language'.tr, value: false),
            buildTextIconRow(context,
                title: "city".tr,
                contentText: "Sharjah",
                routeName: "/selectEmirate"),
            context.sizedBoxHeightSmall,
            buildTextIconRow(context, title: "invite".tr, routeName: "/invite"),
            buildTextIconRow(context,
                title: "Contact Us".tr, routeName: "/contact"),
            buildTextIconRow(context, title: "about".tr, routeName: "/about"),
            context.sizedBoxHeightSmall,
            buildTextIconRow(context, title: "signOut".tr),
          ],
        ),
      ),
    );
  }

  Widget buildTextIconRow(BuildContext context,
      {required String title,
        String? contentText,
        VoidCallback? onTap,
        String? routeName}) {
    final bodyText1 = context.bodyText1;
    final primaryColorLight = context.primaryColorLight;
    return InkWell(
      onTap: () {
        Get.toNamed(routeName ?? "");
      },
      child:
      buildCard(context, title, bodyText1, contentText, primaryColorLight),
    );
  }

  SizedBox buildCard(BuildContext context, String title, TextStyle? bodyText1,
      String? contentText, Color primaryColorLight) {
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
                style: bodyText1,
              ),
              Row(
                children: [
                  Text(
                    contentText ?? "",
                    style: TextStyle(
                      color: primaryColorLight,
                    ),
                  ),
                  const Icon(Icons.arrow_forward_rounded),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildTextSwitchRow(BuildContext context,
      {required String title, bool? value}) {
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
                style: context.bodyText1,
              ),
              Transform.scale(
                scale: 0.7,
                child: SizedBox(
                  width: context.paddingExtraLargeWidth,
                  child: CupertinoSwitch(
                    activeColor: context.primaryColor,
                    value: value ?? false,
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

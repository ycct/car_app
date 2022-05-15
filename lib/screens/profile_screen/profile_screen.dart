import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallawashtest/extensions.dart';
import '../../constants/app_constants.dart';
import '../../controller/bottom_bar_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (BottomNavController bottomNavController) {
      return Scaffold(
        body: ListView(
          children: [
            SizedBox(
              child: buildHeaderRow(context),
            ),
            buildTitleContainer(context, "infoPerson".tr.toUpperCase()),
            context.sizedBoxHeightUltraSmall,
            buildKeyValueRow(
              context,
              key: "id".tr,
              value: "512316",
              iconData: Icons.person,
            ),
            const Divider(
              thickness: 1,
            ),
            buildKeyValueRow(
              context,
              key: "no".tr,
              value: "0535 235 12 12",
              iconData: Icons.phone,
            ),
            const Divider(
              thickness: 1,
            ),
            buildKeyValueRow(
              context,
              key: "email".tr,
              value: "janeMail".tr,
              iconData: Icons.email,
            ),
            const Divider(
              thickness: 1,
            ),
            buildKeyValueRow(
              context,
              key: "gender".tr,
              value: "female",
              iconData: Icons.person_pin_circle_rounded,
            ),
            context.sizedBoxHeightUltraSmall,
            buildTitleContainer(context, "infoAccount".tr.toUpperCase()),
            context.sizedBoxHeightUltraSmall,
            buildKeyValueRow(
              context,
              key: "totalPoints".tr,
              value: "580",
              iconData: Icons.star,
            ),
            const Divider(
              thickness: 1,
            ),
            buildKeyValueRow(
              context,
              key: "redeem".tr,
              value: "2",
              iconData: Icons.post_add,
            ),
            const Divider(
              thickness: 1,
            ),
            buildKeyValueRow(
              context,
              key: "pending".tr,
              value: "8",
              iconData: Icons.pending_actions,
            ),
            const Divider(
              thickness: 1,
            ),
            buildKeyValueRow(
              context,
              key: "leftPoints".tr,
              value: "600",
              iconData: Icons.person_pin_circle_rounded,
            ),
            const Divider(
              thickness: 1,
            ),
            context.sizedBoxHeightUltraSmall,
             Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "resetPass".tr,
                ),
              ),
            ),
             Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "signOut".tr,
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  Container buildTitleContainer(BuildContext context, String title) {
    return Container(
        color: Colors.blue.shade50,
        width: context.dynamicWidth(1),
        height: context.dynamicHeight(0.04),
        child: Padding(
          padding: EdgeInsets.only(
              top: context.paddingExtraSmallHeight,
              left: context.paddingSmallWidth),
          child: Text(
            title,
          ),
        ));
  }

  Widget buildKeyValueRow(BuildContext context,
      {required String key,
      required IconData iconData,
      required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.paddingSmallWidth,
          ),
          child: Row(
            children: [
              Icon(iconData),
              context.sizedBoxWidthExtraSmall,
              Text(key),
            ],
          ),
        ),
        buildValue(context, value: value)
      ],
    );
  }

  Padding buildValue(BuildContext context, {required String value}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.paddingSmallWidth),
      child: Text(value),
    );
  }

  Widget buildHeaderRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: context.paddingSmallHeight,
          horizontal: context.paddingSmallWidth),
      child: Row(
        children: [
          buildCircleAvatar(),
          context.sizedBoxWidthDefault,
          buildHeaderTextColumn(context)
        ],
      ),
    );
  }

  CircleAvatar buildCircleAvatar() {
    return const CircleAvatar(
      radius: 37,
      backgroundImage: NetworkImage(AppConstants.profilePhotoUrl),
    );
  }

  Column buildHeaderTextColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "jane".tr,
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(
          "janeMail".tr,
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    );
  }
}

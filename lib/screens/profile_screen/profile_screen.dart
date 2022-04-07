import 'package:flutter/material.dart';
import 'package:yallawashtest/extensions.dart';
import '../../constants/app_constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            child: buildHeaderRow(context),
          ),
          buildTitleContainer(context, "PERSONAL INFORMATION"),
          context.sizedBoxHeightUltraSmall,
          buildKeyValueRow(
            context,
            key: "Profile ID",
            value: "512316",
            iconData: Icons.person,
          ),
          const Divider(
            thickness: 1,
          ),
          buildKeyValueRow(
            context,
            key: "Number",
            value: "0535 235 12 12",
            iconData: Icons.phone,
          ),
          const Divider(
            thickness: 1,
          ),
          buildKeyValueRow(
            context,
            key: "Email",
            value: "JaneDoe@gmail.com",
            iconData: Icons.email,
          ),
          const Divider(
            thickness: 1,
          ),
          buildKeyValueRow(
            context,
            key: "Gender",
            value: "Female",
            iconData: Icons.person_pin_circle_rounded,
          ),
          context.sizedBoxHeightUltraSmall,
          buildTitleContainer(context, "ACCOUNT INFORMATION"),
          context.sizedBoxHeightUltraSmall,
          buildKeyValueRow(
            context,
            key: "Total Points",
            value: "580",
            iconData: Icons.star,
          ),
          const Divider(
            thickness: 1,
          ),
          buildKeyValueRow(
            context,
            key: "Redeem Points",
            value: "2",
            iconData: Icons.post_add,
          ),
          const Divider(
            thickness: 1,
          ),
          buildKeyValueRow(
            context,
            key: "Pending Bookings",
            value: "8",
            iconData: Icons.pending_actions,
          ),
          const Divider(
            thickness: 1,
          ),
          buildKeyValueRow(
            context,
            key: "Point Left to be a VIP",
            value: "600",
            iconData: Icons.person_pin_circle_rounded,
          ),
          const Divider(
            thickness: 1,
          ),
          context.sizedBoxHeightUltraSmall,
          const Card(
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Reset Password",
              ),
            ),
          ),
          const Card(
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Sign Out",
              ),
            ),
          )
        ],
      ),
    );
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
          AppConstants.janeDoe,
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(
          "JaneDoe@gmail.com",
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    );
  }
}

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
          Container(
            color: Colors.blue.shade100,
            width: context.dynamicWidth(1),
            height: context.dynamicHeight(0.04),
            child: buildTitle(context, "PERSONAL INFORMATION"),
          ),
          Column(
            children: [
              buildPadding(context),
              const Divider(color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }

  Padding buildPadding(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.paddingExtraSmallHeight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildKeyRow(context),
          buildValue(context),
        ],
      ),
    );
  }

  Widget buildKeyRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.paddingSmallWidth,
      ),
      child: Row(
        children: const [
          Icon(Icons.person),
          Text("Profile ID"),
        ],
      ),
    );
  }

  Padding buildValue(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.paddingSmallWidth),
      child: const Text("561235"),
    );
  }

  Padding buildTitle(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.only(
          top: context.paddingExtraSmallHeight,
          left: context.paddingSmallWidth),
      child: Text(
        title,
      ),
    );
  }

  Widget buildHeaderRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: context.paddingExtraSmallHeight,
          horizontal: context.paddingSmallWidth),
      child: Row(
        children: [
          buildCircleAvatar(),
          context.sizedBoxWidthDefault,
          buildColumn(context)
        ],
      ),
    );
  }

  Column buildColumn(BuildContext context) {
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

  CircleAvatar buildCircleAvatar() {
    return const CircleAvatar(
      radius: 37,
      backgroundImage: NetworkImage(AppConstants.profilePhotoUrl),
    );
  }
}

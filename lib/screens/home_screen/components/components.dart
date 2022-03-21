import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallawashtest/extensions.dart';
import '../../../constants/app_constants.dart';

Padding buildCategoryTitle(BuildContext context, String title) {
  return Padding(
    padding: EdgeInsets.only(left: context.paddingDefaultWidth),
    child: Text(
      title,
      style: context.textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
    ),
  );
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    leadingWidth: context.paddingExtraLargeWidth * 1.5,
    leading: Icon(
      Icons.wrap_text_sharp,
      size: AppConstants.defaultFont,
      color: Theme.of(context).disabledColor,
    ),
    elevation: 0,
    title: Text(
      AppConstants.home,
      style: Theme.of(context)
          .textTheme
          .headline5
          ?.copyWith(color: Theme.of(context).disabledColor),
    ),
    centerTitle: true,
    actions: [
      Icon(
        Icons.shopping_bag,
        size: AppConstants.defaultFont,
        color: Theme.of(context).disabledColor,
      ),
      context.sizedBoxWidthExtraSmall,
      buildCircleAvatar(context),
      context.sizedBoxWidthSmall,
    ],
  );
}

CircleAvatar buildCircleAvatar(BuildContext context) {
  return CircleAvatar(
    radius: 22,
    backgroundColor: Theme.of(context).disabledColor,
    child: const CircleAvatar(
      radius: 20,
      backgroundImage: NetworkImage(AppConstants.profilePhotoUrl),
    ),
  );
}

Padding buildFloating(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(AppConstants.extraSmallPadding),
    child: SizedBox(
      height: 70,
      width: 70,
      child: FloatingActionButton(
        child: const Icon(
          Icons.workspaces_filled,
          color: Colors.blue,
          size: AppConstants.largeFont,
        ),
        elevation: 5,
        backgroundColor: Theme.of(context).disabledColor,
        onPressed: () {},
      ),
    ),
  );
}

RichText buildRichText(BuildContext context) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: "0.",
          style: context.textTheme.headline4
              ?.copyWith(color: Theme.of(context).disabledColor),
        ),
        TextSpan(
          text: "00",
          style: TextStyle(color: Theme.of(context).disabledColor),
        ),
        TextSpan(
          text: " AED",
          style: TextStyle(color: Theme.of(context).disabledColor),
        ),
      ],
    ),
  );
}

class CustomShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

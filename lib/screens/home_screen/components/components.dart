import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallawashtest/extensions.dart';

import '../../../constants/app_constants.dart';

Padding buildCategoryTitle(BuildContext context,String title) {
  return Padding(
    padding: EdgeInsets.only(left: context.paddingDefaultWidth),
    child: Text(
      title,
      style: context.textTheme.headline5!
          .copyWith(color: Colors.blue, fontWeight: FontWeight.bold),
    ),
  );
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    leadingWidth: context.paddingExtraLargeWidth * 1.5,
    leading: const Icon(
      Icons.wrap_text_sharp,
      size: AppConstants.myDefaultFont,
    ),
    elevation: 0,
    title: Text(
      AppConstants.home,
      style: Theme.of(context)
          .textTheme
          .headline5!
          .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    actions: [
      const Icon(
        Icons.shopping_bag,
        size: AppConstants.myDefaultFont,
      ),
      context.mySizedBoxWidthExtraSmall,
      buildCircleAvatar(),
      context.mySizedBoxWidthSmall,
    ],
  );
}

CircleAvatar buildCircleAvatar() {
  return CircleAvatar(
    radius: 22,
    backgroundColor: Colors.white,
    child: CircleAvatar(radius: 20, backgroundColor: Colors.blue.shade300),
  );
}

Padding buildFloating() {
  return Padding(
    padding: const EdgeInsets.all(AppConstants.myExtraSmallPadding),
    child: SizedBox(
      height: 70,
      width: 70,
      child: FloatingActionButton(
        child: const Icon(
          Icons.workspaces_filled,
          color: Colors.blue,
          size: AppConstants.myLargeFont,
        ),
        elevation: 5,
        backgroundColor: Colors.white,
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
          style: context.textTheme.headline4!,
        ),
        const TextSpan(
          text: "00",
        ),
        const TextSpan(
          text: " AED",
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

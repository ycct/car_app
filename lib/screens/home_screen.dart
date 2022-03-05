import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallawashtest/constants/app_constants.dart';
import 'package:yallawashtest/controller/bottom_bar_controller.dart';
import 'package:yallawashtest/extensions.dart';

import '../widgets/card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: BottomNavController(),
        builder: (BottomNavController b) {
          return Scaffold(
            appBar: buildAppBar(context),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 13,
                  child: ClipPath(
                    clipper: CustomShape(),
                    child: Stack(
                      children: [
                        Container(
                          color: Colors.blue,
                        ),
                        Positioned(
                            top: context.paddingExtraLargeWidth,
                            right: context.paddingSmallWidth,
                            child: Column(
                              children: [
                                const Text(
                                  AppConstants.totalPoints,
                                ),
                                Text(AppConstants.totalPointsValue,
                                    style: context.textTheme.headline5!),
                              ],
                            )),
                        Padding(
                          padding:
                              EdgeInsets.only(left: context.paddingSmallWidth),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppConstants.hiJaneDoe,
                                style: context.textTheme.headline5!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              context.mySizedBoxHeightMicro,
                              const Text(
                                AppConstants.yourBalance,
                              ),
                              context.mySizedBoxHeightUltraSmall,
                              buildRichText(context),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: buildCategoryTitle(context,AppConstants.remainingDeals),
                ),
                Expanded(
                  flex: 11,
                  child: MyCard(
                    myWidth: Get.width * 0.75,
                    myHeight: Get.height * 0.16,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: buildCategoryTitle(context, AppConstants.placeHolder)
                ),
                Expanded(
                  flex: 11,
                  child: MyCard(
                    myWidth: Get.width * 0.50,
                    myHeight: Get.height * 0.12,
                  ),
                ),
                const Spacer(
                  flex: 5,
                )
              ],
            ),
            floatingActionButton: buildFloating(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: b.buildAnimatedBottomNavigationBar(),
          );
        });
  }

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

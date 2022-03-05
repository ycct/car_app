import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallawashtest/constants/app_constants.dart';
import 'package:yallawashtest/controller/bottom_bar_controller.dart';
import 'package:yallawashtest/extensions.dart';
import 'package:yallawashtest/widgets/small_card.dart';
import '../../widgets/card.dart';
import 'components/components.dart';

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
            body: ListView(
              children: [
                ClipPath(
                  clipper: CustomShape(),
                  child: Stack(
                    children: [
                      Container(
                        color: Colors.blue,
                        width: context.dynamicWidth(1),
                        height: context.dynamicHeight(0.22),
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
                                  style: context.textTheme.headline4!),
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
                buildCategoryTitle(context, AppConstants.remainingDeals),
                MyCard(
                  myWidth: context.dynamicWidth(0.7),
                  myHeight: context.dynamicHeight(0.14),
                ),
                context.mySizedBoxHeightExtraSmall,
                buildCategoryTitle(context, AppConstants.placeHolder),
                MyCardDetailed(
                  myWidth: context.dynamicWidth(0.7),
                  myHeight: context.dynamicHeight(0.22),
                ),
              ],
            ),
            floatingActionButton: buildFloating(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: b.buildAnimatedBottomNavigationBar(),
          );
        });
  }
}

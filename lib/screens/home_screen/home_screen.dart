import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallawashtest/constants/app_constants.dart';
import 'package:yallawashtest/controller/bottom_bar_controller.dart';
import 'package:yallawashtest/extensions.dart';
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
                  child:
                  buildCategoryTitle(context, AppConstants.remainingDeals),
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
                    child:
                    buildCategoryTitle(context, AppConstants.placeHolder)),
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
}


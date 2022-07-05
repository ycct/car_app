import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallawashtest/constants/app_constants.dart';
import 'package:yallawashtest/extensions.dart';
import '../../controller/bottom_bar_controller.dart';
import 'components/components.dart';
import 'components/place_holder_listview.dart';
import 'components/remainin_deals_listview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (BottomNavController bottomNavController) {
      return Scaffold(
        body: ListView(
          children: [
            ClipPath(
              clipper: CustomShape(),
              child: Stack(
                children: [
                  Container(
                    width: context.dynamicWidth(1),
                    height: context.dynamicHeight(0.22),
                    color: context.primaryColor,
                  ),
                  Positioned(
                    top: context.paddingExtraLargeWidth,
                    right: context.paddingSmallWidth,
                    child: Column(
                      children: [
                        Text(
                          "totalPoints".tr,
                          style: context.bodyText1
                              ?.copyWith(color: context.disabledColor),
                        ),
                        Text(
                          "pointsValue".tr,
                          style: context.headline4?.copyWith(
                            color: context.disabledColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: context.paddingSmallWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "hiJane".tr,
                          style: context.headline5?.copyWith(
                              color: context.disabledColor),
                        ),
                        context.sizedBoxHeightMicro,
                        Text(
                          "yourBalance".tr,
                          style: context.bodyText2
                              ?.copyWith(color: context.disabledColor),
                        ),
                        context.sizedBoxHeightUltraSmall,
                        buildRichText(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: context.paddingLargeWidth),
              child: buildCarouselSlider(),
            ),
            context.sizedBoxHeightUltraSmall,
            buildCategoryTitle(context, "remainingDeals".tr),
            InkWell(
              onTap: () {
                Get.find<BottomNavController>().jumpToPage(4);
              },
              child: RemainingCardsListView(
                title: "deal".tr,
                details: "detailsHere".tr,
                myWidth: context.dynamicWidth(0.7),
                myHeight: context.dynamicHeight(0.14),
              ),
            ),
            context.sizedBoxHeightExtraSmall,
            buildCategoryTitle(context, "placeHolder".tr),
            PlaceHolderCardsListView(
              imageUrl: AppConstants.photoUrl,
              width: context.dynamicWidth(0.75),
              height: context.dynamicHeight(0.2),
            ),
          ],
        ),
      );
    });
  }
}

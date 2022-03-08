import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallawashtest/constants/app_constants.dart';
import 'package:yallawashtest/controller/bottom_bar_controller.dart';
import 'package:yallawashtest/extensions.dart';
import 'components/components.dart';
import 'components/place_holder_listview.dart';
import 'components/remainin_deals_listview.dart';

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
                            context.sizedBoxHeightMicro,
                            const Text(
                              AppConstants.yourBalance,
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
                  padding: EdgeInsets.symmetric(
                      horizontal: context.paddingLargeWidth),
                  child: CarouselSlider.builder(
                      itemCount: 5,
                      itemBuilder: (context, index, realIndex) {
                        return Text(
                          AppConstants.bodyText,
                          textAlign: TextAlign.center,
                          style: context.textTheme.subtitle2!.copyWith(
                            color: Colors.blue,
                          ),
                        );
                      },
                      options: CarouselOptions(
                        height: 50,
                        autoPlay: true,
                        viewportFraction: 1,
                      )),
                ),
                context.sizedBoxHeightUltraSmall,
                buildCategoryTitle(context, AppConstants.remainingDeals),
                RemainingCardsListView(
                  title: "Deal",
                  details: "Details Here",
                  myWidth: context.dynamicWidth(0.7),
                  myHeight: context.dynamicHeight(0.14),
                ),
                context.sizedBoxHeightExtraSmall,
                buildCategoryTitle(context, AppConstants.placeHolder),
                PlaceHolderCardsListView(
                  dayLeft: AppConstants.daysLeft,
                  offerName: AppConstants.theOfferName,
                  offerDetail: AppConstants.theOffersDetails,
                  imageUrl: AppConstants.photoUrl,
                  width: context.dynamicWidth(0.75),
                  height: context.dynamicHeight(0.2),
                ),
                context.sizedBoxHeightExtraSmall,
                buildCategoryTitle(context, AppConstants.placeHolder),
                PlaceHolderCardsListView(
                  dayLeft: AppConstants.daysLeft,
                  offerName: AppConstants.theOfferName,
                  offerDetail: AppConstants.theOffersDetails,
                  imageUrl: AppConstants.photoUrl,
                  width: context.dynamicWidth(0.75),
                  height: context.dynamicHeight(0.2),
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

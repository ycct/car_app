import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallawashtest/constants/app_constants.dart';
import 'package:yallawashtest/controller/bottom_bar_controller.dart';
import 'package:yallawashtest/extensions.dart';
import 'components/components.dart';
import 'components/navigation_drawer.dart';
import 'components/place_holder_listview.dart';
import 'components/remainin_deals_listview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return GetBuilder(
      init: BottomNavController(),
      builder: (BottomNavController b) {
        return Scaffold(
          key: _scaffoldKey,
          drawer: const NavigationDrawer(),
          appBar: buildAppBar(context, () {
            _scaffoldKey.currentState?.openDrawer();
          }),
          body: ListView(
            children: [
              ClipPath(
                clipper: CustomShape(),
                child: Stack(
                  children: [
                    Container(
                      width: context.dynamicWidth(1),
                      height: context.dynamicHeight(0.22),
                      color: Theme.of(context).primaryColor,
                    ),
                    Positioned(
                      top: context.paddingExtraLargeWidth,
                      right: context.paddingSmallWidth,
                      child: Column(
                        children: [
                          Text(
                            AppConstants.totalPoints,
                            style: context.textTheme.bodyText1?.copyWith(
                                color: Theme.of(context).disabledColor),
                          ),
                          Text(
                            AppConstants.totalPointsValue,
                            style: context.textTheme.headline4?.copyWith(
                              color: Theme.of(context).disabledColor,
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
                            AppConstants.hiJaneDoe,
                            style: context.textTheme.headline5?.copyWith(
                                color: Theme.of(context).disabledColor),
                          ),
                          context.sizedBoxHeightMicro,
                          Text(
                            AppConstants.yourBalance,
                            style: context.textTheme.bodyText2?.copyWith(
                                color: Theme.of(context).disabledColor),
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
          floatingActionButton: buildFloating(context),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: b.buildAnimatedBottomNavigationBar(context),
        );
      },
    );
  }
}

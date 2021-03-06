import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallawashtest/constants/app_constants.dart';
import 'package:yallawashtest/extensions.dart';
import 'components/booked_tab.dart';
import 'components/previous_tab.dart';

class RemainingDealsScreen extends StatefulWidget {
  const RemainingDealsScreen({Key? key}) : super(key: key);

  @override
  State<RemainingDealsScreen> createState() => _RemainingDealsScreenState();
}

class _RemainingDealsScreenState extends State<RemainingDealsScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.dynamicHeight(0.9),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                buildTabBackground(context),
                buildTabs(context),
              ],
            ),
            Expanded(
                child: TabBarView(
              controller: tabController,
              children: const [
                BookedTab(),
                PreviousTab(),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Container buildTabs(BuildContext context) {
    return Container(
      width: context.dynamicWidth(0.8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.extraSmallRadius),
          color: Colors.white38),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(context.paddingUltraSmallWidth),
            child: TabBar(
              indicatorColor: Colors.transparent,
              controller: tabController,
              labelColor: context.primaryColor,
              indicator: BoxDecoration(
                color: context.disabledColor,
                borderRadius:
                    BorderRadius.circular(AppConstants.extraSmallRadius),
              ),
              tabs: [
                buildTabSection(context, title: "booked".tr),
                buildTabSection(context, title: "Previous".tr),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Tab buildTabSection(BuildContext context, {required String title}) {
    return Tab(
      text: title,
      height: context.dynamicHeight(0.03),
    );
  }

  Container buildTabBackground(BuildContext context) {
    return Container(
      color: context.primaryColor,
      width: context.dynamicWidth(1),
      height: context.dynamicHeight(0.08),
    );
  }
}

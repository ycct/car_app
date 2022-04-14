import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallawashtest/extensions.dart';

class MyAddresses extends StatelessWidget {
  const MyAddresses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarForSecondScreens(context,
          title: Get.currentRoute.tr, leading: "cancel".tr),
      body: ListView(
        children: [
          buildAddressCard(context),
          buildAddressCard(context),
          buildAddressCard(context),
        ],
      ),
    );
  }

  SizedBox buildAddressCard(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: context.dynamicHeight(0.1),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.paddingSmallWidth),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("addressNo1".tr),
                  context.sizedBoxHeightUltraSmall,
                  Text(
                    "addressNo2".tr,
                    style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "detailsHere".tr,
                    style: TextStyle(
                        color: Theme.of(context).primaryColorLight),
                  ),
                  const Icon(Icons.arrow_forward_rounded)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

AppBar buildAppBarForSecondScreens(BuildContext context,
    {required String title, required String leading, VoidCallback? onTap}) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    leadingWidth: context.dynamicWidth(0.2),
    leading: InkWell(
      onTap: () {
        Get.back();
      },
      child: Center(
        child: Text(leading),
      ),
    ),
    actions: [
      Center(
        child: Text("done".tr),
      ),
      context.sizedBoxWidthExtraSmall
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallawashtest/extensions.dart';
import 'my_addresses_screen.dart';

class SelectEmirateScreen extends StatelessWidget {
  const SelectEmirateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarForSecondScreens(context,
          title: Get.currentRoute.tr, leading: "cancel".tr),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: context.paddingDefaultHeight,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: context.paddingSmallWidth),
            child: Text("selectEmirate".tr.toUpperCase()),
          ),
          context.sizedBoxHeightExtraSmall,
          buildSelectCityRow(context, isSelected: false, title: "Dubai"),
          buildSelectCityRow(context, isSelected: false, title: "Al Ain"),
          buildSelectCityRow(context, isSelected: true, title: "Abu Dhabi"),
          buildSelectCityRow(context, isSelected: false, title: "Sharjah"),
          buildSelectCityRow(context,
              isSelected: false, title: "Ras Al Khaima"),
          buildSelectCityRow(context, isSelected: false, title: "Fujeirah"),
          buildSelectCityRow(context, isSelected: false, title: "Um Al Quawin"),
        ]),
      ),
    );
  }

  Widget buildSelectCityRow(BuildContext context,
      {required String title, required bool isSelected}) {
    return InkWell(
      onTap: () {
        isSelected = !isSelected;
      },
      child: SizedBox(
        width: double.infinity,
        height: context.dynamicHeight(0.06),
        child: Card(
          elevation: 1,
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: context.paddingSmallWidth),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                isSelected ? const Icon(Icons.done_all) : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yallawashtest/extensions.dart';
import '../constants/app_constants.dart';
import '../constants/images_paths.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cardTotalHeight = context.dynamicHeight(0.24);
    double centerToTop = cardTotalHeight / 2;
    double textHeight24 = 24;
    double textHeight36 = 36;
    double textsPadding = context.paddingUltraSmallHeight;
    double centerPoint = centerToTop - textHeight36/2;
    return Padding(
      padding: EdgeInsets.all(context.paddingUltraSmallWidth),
      child: SizedBox(
        height: context.dynamicHeight(0.24),
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(AppConstants.defaultRadius),
          ),
          elevation: 2,
          child: Stack(children: [
            buildBrushPaint(),
            buildTexts(context, textHeight24, Theme.of(context).disabledColor,
                title: "50%off".tr, left: context.paddingExtraSmallWidth, top: centerToTop - textHeight24/2),
            buildTexts(context, textHeight36, Theme.of(context).primaryColor,
                title: "50%off".tr, right: 10, top: centerPoint),
            buildTexts(context, textHeight24, Theme.of(context).primaryColor,
                title: "vipWash".tr, right: 10, top: centerPoint + textHeight36 +textsPadding ),
            buildTexts(context, 12, Theme.of(context).primaryColor,
                title: "viewMore".tr, right: context.paddingExtraSmallWidth, bottom: context.paddingExtraSmallHeight)
          ]),
        ),
      ),
    );
  }

  Positioned buildBrushPaint() {
    return Positioned(
      bottom: -250,
      left: -260,
      child: SvgPicture.asset(
        ImagePaths.brush,
        fit: BoxFit.cover,
        height: 580,
      ),
    );
  }

  Positioned buildTexts(BuildContext context, double fontSize, Color color,
      {double? left,
        double? top,
        String? title,
        double? right,
        double? bottom}) {

    return Positioned(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
      child: Text(
        title ?? "",
        style: TextStyle(
          fontSize: fontSize,
          color: color,
        ),
      ),
    );
  }

}

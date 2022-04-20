import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yallawashtest/constants/app_constants.dart';
import 'package:yallawashtest/constants/images_paths.dart';
import 'package:yallawashtest/extensions.dart';

class BookedTab extends StatelessWidget {
  const BookedTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(context.paddingExtraSmallWidth),
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(context.paddingUltraSmallWidth),
              child: SizedBox(
                height: context.dynamicHeight(0.25),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(AppConstants.defaultRadius),
                  ),
                  elevation: 2,
                  child: Stack(children: [
                    Positioned(
                      bottom: -250,
                      left: -260,
                      child: SvgPicture.asset(
                        ImagePaths.brush,
                        // height: context.dynamicWidth(1.5),
                        fit: BoxFit.cover,
                        height: 560,
                      ),
                    ),
                    buildTexts(context, 24, Theme.of(context).disabledColor,
                        title: "50% OFF", left: 5, top: 100),
                    buildTexts(context, 36, Theme.of(context).primaryColor,
                        title: "50% OFF", right: 10, top: 60),
                    buildTexts(context, 24, Theme.of(context).primaryColor,
                        title: "VIP CAR WASH", right: 10, top: 60 + 35),
                    buildTexts(context, 12, Theme.of(context).primaryColor,
                        title: "View More", right: 10, bottom: 10)
                  ]),
                ),
              ),
            );
          },
        ),
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

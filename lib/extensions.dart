import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double dynamicHeight(double value) =>
      MediaQuery
          .of(this)
          .size
          .height * value;

  double dynamicWidth(double value) =>
      MediaQuery
          .of(this)
          .size
          .width * value;

  ThemeData get theme => Theme.of(this);
}

extension PaddingValues on BuildContext {
  /// Width
  double get paddingUltraSmallWidth => dynamicWidth(0.01);
  double get paddingExtraSmallWidth => dynamicWidth(0.02);
  double get paddingSmallWidth => dynamicWidth(0.04);
  double get paddingDefaultWidth => dynamicWidth(0.06);
  double get paddingLargeWidth => dynamicWidth(0.08);
  double get paddingExtraLargeWidth => dynamicWidth(0.1);

  /// Height
  double get paddingExtraSmallHeight => dynamicHeight(0.01);
  double get paddingSmallHeight => dynamicHeight(0.01);
  double get paddingDefaultHeight => dynamicHeight(0.01);
  double get paddingLargeHeight => dynamicHeight(0.01);
  double get paddingExtraLargeHeight => dynamicHeight(0.01);
}

extension EmptyWidget on BuildContext {
  Widget get mySizedBoxHeightMicro =>
      SizedBox(
        height: dynamicHeight(0.005),
      );
  Widget get mySizedBoxHeightUltraSmall =>
      SizedBox(
        height: dynamicHeight(0.01),
      );
  Widget get mySizedBoxHeightExtraSmall =>
      SizedBox(
        height: dynamicHeight(0.02),
      );
  Widget get mySizedBoxHeightSmall =>
      SizedBox(
        height: dynamicHeight(0.04),
      );
  Widget get mySizedBoxHeightDefault =>
      SizedBox(
        height: dynamicHeight(0.06),
      );
  Widget get mySizedBoxHeightLarge =>
      SizedBox(
        width: dynamicHeight(0.08),
      );
  Widget get mySizedBoxHeightExtraLarge =>
      SizedBox(
        width: dynamicHeight(0.1),
      );

  Widget get mySizedBoxWidthExtraSmall =>
      SizedBox(
        width: dynamicWidth(0.02),
      );
  Widget get mySizedBoxWidthSmall =>
      SizedBox(
        width: dynamicWidth(0.04),
      );

  Widget get mySizedBoxWidthDefault =>
      SizedBox(
        width: dynamicWidth(0.06),
      );
  Widget get mySizedBoxWidthLarge =>
      SizedBox(
        width: dynamicWidth(0.08),
      );
  Widget get mySizedBoxWidthExtraLarge =>
      SizedBox(
        width: dynamicWidth(0.1),
      );


}

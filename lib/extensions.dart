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
  double get paddingUltraSmallHeight => dynamicHeight(0.005);
  double get paddingExtraSmallHeight => dynamicHeight(0.01);
  double get paddingSmallHeight => dynamicHeight(0.02);
  double get paddingDefaultHeight => dynamicHeight(0.04);
  double get paddingLargeHeight => dynamicHeight(0.08);
  double get paddingExtraLargeHeight => dynamicHeight(0.08);
}

extension EmptyWidget on BuildContext {
  Widget get sizedBoxHeightMicro =>
      SizedBox(
        height: dynamicHeight(0.005),
      );
  Widget get sizedBoxHeightUltraSmall =>
      SizedBox(
        height: dynamicHeight(0.01),
      );
  Widget get sizedBoxHeightExtraSmall =>
      SizedBox(
        height: dynamicHeight(0.02),
      );
  Widget get sizedBoxHeightSmall =>
      SizedBox(
        height: dynamicHeight(0.04),
      );
  Widget get sizedBoxHeightDefault =>
      SizedBox(
        height: dynamicHeight(0.06),
      );
  Widget get sizedBoxHeightLarge =>
      SizedBox(
        width: dynamicHeight(0.08),
      );
  Widget get sizedBoxHeightExtraLarge =>
      SizedBox(
        width: dynamicHeight(0.1),
      );

  Widget get sizedBoxWidthExtraSmall =>
      SizedBox(
        width: dynamicWidth(0.02),
      );
  Widget get sizedBoxWidthSmall =>
      SizedBox(
        width: dynamicWidth(0.04),
      );

  Widget get sizedBoxWidthDefault =>
      SizedBox(
        width: dynamicWidth(0.06),
      );
  Widget get sizedBoxWidthLarge =>
      SizedBox(
        width: dynamicWidth(0.08),
      );
  Widget get sizedBoxWidthExtraLarge =>
      SizedBox(
        width: dynamicWidth(0.1),
      );


}

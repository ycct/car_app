import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../utils/alert_enum.dart';

class CustomSnackBar {
  static const SnackPosition _snackPosition = SnackPosition.TOP;
  static const EdgeInsets _margin = EdgeInsets.symmetric(
    vertical: 20,
    horizontal: 10,
  );
  static const Duration _snackBarDuration = Duration(seconds: 3);
  static const double _width = double.infinity;

  CustomSnackBar.showSuccessMessage(String message) {
    const AlertEnum alertEnum = AlertEnum.success;
    Get.snackbar(
      alertEnum.titleText,
      message,
      margin: _margin,
      snackPosition: _snackPosition,
      backgroundColor: alertEnum.backgroundColor,
      colorText: alertEnum.textColor,
      duration: _snackBarDuration,
      maxWidth: _width,
    );
  }

  CustomSnackBar.showWarningMessage(String message) {
    const AlertEnum alertEnum = AlertEnum.warning;
    Get.snackbar(
      alertEnum.titleText,
      message,
      margin: _margin,
      snackPosition: _snackPosition,
      backgroundColor: alertEnum.backgroundColor,
      colorText: alertEnum.textColor,
      duration: _snackBarDuration,
      maxWidth: _width,
    );
  }

  CustomSnackBar.showErrorMessage(var e) {
    const AlertEnum alertEnum = AlertEnum.danger;
    String message = "Error";

    if (kDebugMode) {
      message = e.toString();
    }

    Get.snackbar(
      alertEnum.titleText,
      message,
      margin: _margin,
      snackPosition: _snackPosition,
      backgroundColor: alertEnum.backgroundColor,
      colorText: alertEnum.textColor,
      duration: _snackBarDuration,
      maxWidth: _width,
    );
  }
}
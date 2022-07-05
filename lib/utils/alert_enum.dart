import 'package:flutter/material.dart';

enum AlertEnum { success, danger, warning, info }

extension AlertEnumExtension on AlertEnum {
  Color get backgroundColor {
    switch (this) {
      case AlertEnum.success:
        return const Color(0xFFd4edda);
      case AlertEnum.danger:
        return const Color(0xFFf8d7da);
      case AlertEnum.warning:
        return const Color(0xFFfff3cd);
      case AlertEnum.info:
        return const Color(0xFFd1ecf1);
      default:
        throw Exception("AlertEnumExtension value exception");
    }
  }

  Color get textColor {
    switch (this) {
      case AlertEnum.success:
        return Colors.green;
      case AlertEnum.danger:
        return Colors.red;
      case AlertEnum.warning:
        return Colors.yellow;
      case AlertEnum.info:
        return Colors.blue;
      default:
        throw Exception("AlertEnumExtension value exception");
    }
  }

  String get titleText {
    switch (this) {
      case AlertEnum.success:
        return "Success";
      case AlertEnum.danger:
        return "Error";
      case AlertEnum.warning:
        return "Unexpected Error";
      case AlertEnum.info:
        return "Info";
      default:
        throw Exception("AlertEnumExtension value exception");
    }
  }
}
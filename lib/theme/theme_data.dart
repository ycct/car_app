import 'package:flutter/material.dart';

class LightTheme {
  static const Color primaryColor = Colors.blue;
  static const Color secondaryColor = Colors.white;

  static ThemeData lightTheme = ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        color: primaryColor,
      ),
    ),
    primarySwatch: Colors.blue,
    primaryColor: primaryColor,
    disabledColor: secondaryColor,
    scaffoldBackgroundColor: Colors.grey.shade50,
    textTheme: const TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
      headline4: TextStyle(),
      headline5: TextStyle(),
      headline6: TextStyle(),
      subtitle1: TextStyle(),
      subtitle2: TextStyle(),
    ).apply(
      bodyColor: primaryColor,
      displayColor: primaryColor,
    ),
    iconTheme: const IconThemeData(color: primaryColor),
  );
}

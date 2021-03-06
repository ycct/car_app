import 'package:flutter/material.dart';

class LightTheme {
  static const Color primaryColor = Colors.blue;
  static const Color secondaryColor = Colors.white;
  static  Color backgroundColor = Colors.grey.shade50;
  static  Color greyLight = Colors.grey.shade400  ;

  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: primaryColor),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        color: primaryColor,
      ),
    ),
    primaryColorLight: primaryColor.withOpacity(0.5),
    primarySwatch: Colors.blue,
    primaryColor: primaryColor,
    disabledColor: secondaryColor,
    bottomAppBarColor: greyLight,
    scaffoldBackgroundColor: backgroundColor,
    textTheme: const TextTheme(
      headline4: TextStyle(fontWeight: FontWeight.bold),
      headline5: TextStyle(fontWeight: FontWeight.bold),
      headline6: TextStyle(fontWeight: FontWeight.bold),
      subtitle1: TextStyle(letterSpacing: 0,fontWeight: FontWeight.bold,fontSize: 16,),
      subtitle2: TextStyle(letterSpacing: 0,fontWeight: FontWeight.bold,fontSize: 14),
      bodyText1: TextStyle(letterSpacing: 0,fontWeight: FontWeight.normal,fontSize: 16),
      bodyText2: TextStyle(letterSpacing: 0,fontWeight: FontWeight.normal,fontSize: 14,),
      caption: TextStyle(letterSpacing: 0),
      overline: TextStyle(letterSpacing: 0),
    ).apply(
      bodyColor: primaryColor,
      displayColor: primaryColor,
    ),
    iconTheme: const IconThemeData(color: primaryColor),
  );
}

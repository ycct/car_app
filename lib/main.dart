import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey.shade50,
        textTheme: const TextTheme(
            headline5: TextStyle(color: Colors.white),
            headline6: TextStyle(color: Colors.white),
            headline4: TextStyle(color: Colors.white),
            subtitle1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white))
      ),
      home: const HomeScreen(),
    );
  }
}

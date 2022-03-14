import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:yallawashtest/bindings/bindings.dart';
import 'package:yallawashtest/routes/app_routes.dart';
import 'package:yallawashtest/screens/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      initialBinding: MainBinding(),
      getPages: AppRoutes.routes,
      home: const HomeScreen(),
      theme: buildThemeData(context),
    );
  }

  ThemeData buildThemeData(BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: Colors.grey.shade50,
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.blue,
          ),

    );
  }
}

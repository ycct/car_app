import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallawashtest/bindings/bindings.dart';
import 'package:yallawashtest/routes/app_routes.dart';
import 'package:yallawashtest/screens/home_screen/home_screen.dart';
import 'package:yallawashtest/theme/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.cupertino,
        initialRoute: "/splash",
        initialBinding: MainBinding(),
        getPages: AppRoutes.routes,
        home: const HomeScreen(),
        theme: LightTheme.lightTheme);
  }
}

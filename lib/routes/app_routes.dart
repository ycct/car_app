import 'package:get/get.dart';
import 'package:yallawashtest/screens/verification_screen.dart';
import '../bindings/login_binding.dart';
import '../bindings/verification_binding.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/login_screen/login_screen.dart';
import '../screens/splash_screen/splash_screen.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/splash',
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: '/home',
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: '/login',
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: '/verification',
      page: () => const VerificationScreen(),
      binding: VerificationBinding(),
    ),
  ];
}

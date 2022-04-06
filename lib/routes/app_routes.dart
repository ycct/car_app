import 'package:get/get.dart';
import 'package:yallawashtest/screens/main_screen/main_screen.dart';
import 'package:yallawashtest/screens/signup_screen/signup_screen.dart';
import 'package:yallawashtest/screens/verification_screen/verification_screen.dart';
import 'package:yallawashtest/screens/verified_screen/verified_screen.dart';
import '../bindings/bindings.dart';
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
    GetPage(
      name: '/verified',
      page: () => const VerifiedScreen(),
    ),
    GetPage(
      name: '/signup',
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: '/main',
      page: () => const MainScreen(),
    )
  ];
}

import 'package:get/get.dart';
import 'package:yallawashtest/controller/bottom_bar_controller.dart';
import '../controller/auth_controller.dart';
import '../controller/login_controller.dart';
import '../controller/verification.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController());
    Get.put(AuthController());
  }
}

class VerificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => VerificationController(),
    );
  }
}

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}

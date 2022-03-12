import 'package:get/get.dart';
import 'package:yallawashtest/controller/bottom_bar_controller.dart';
import '../controller/auth_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController());
    Get.put(AuthController());
  }
}

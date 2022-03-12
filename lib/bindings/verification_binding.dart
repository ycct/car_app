import 'package:get/get.dart';

import '../controller/verification.dart';

class VerificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => VerificationController(),
    );
  }
}

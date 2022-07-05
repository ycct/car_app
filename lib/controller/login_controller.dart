import 'package:get/get.dart';
import 'package:yallawashtest/models/code_response_model.dart';
import '../models/code_request_model.dart';

class LoginController extends GetxController {
  VerificationCodeRequestModel? verificationCodeRequestModel;
  VerificationCodeResponseModel? verificationCodeResponseModel;
  String countryCode = "249";
  String verificationCode = "";

  void countryCodePicker(String number) {
    countryCode = number.substring(1);
    update();
  }
}

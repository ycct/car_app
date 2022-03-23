import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:yallawashtest/constants/app_constants.dart';
import 'package:yallawashtest/models/code_response_model.dart';
import '../constants/service.dart';
import '../models/code_request_model.dart';

class LoginController extends GetxController {
  VerificationCodeRequestModel? verificationCodeRequestModel;
  VerificationCodeResponseModel? verificationCodeResponseModel;
  TextEditingController numberController = TextEditingController();
  TextEditingController verifyControllerFirst = TextEditingController();
  TextEditingController verifyControllerSecond = TextEditingController();
  TextEditingController verifyControllerThird = TextEditingController();
  TextEditingController verifyControllerFourth = TextEditingController();
  String countryCode = "249";
  String verificationCode = "";

  Future<dynamic> login() async {
    String getCodeUrl =
        "${Service.userApi}$countryCode${numberController.text}";
    Uri serviceUri = Uri.parse(Service.baseUrl + getCodeUrl);
    try {
      http.Response response = await http.get(serviceUri);
      Map<String, dynamic> responseMap = jsonDecode(response.body);
      verificationCodeRequestModel =
          VerificationCodeRequestModel.fromJson(responseMap);
      return verificationCodeRequestModel;
    } catch (e) {
      return e;
    }
  }

  Future loginRequestChecker() async {
    if (verificationCodeRequestModel != null) {
      if (verificationCodeRequestModel!.result == "Success") {
        Get.snackbar(AppConstants.myAppName,
            verificationCodeRequestModel!.responseMessage ?? "");
        Timer(
          const Duration(seconds: 2),
          () => Get.toNamed("/verification"),
        );
      } else {
        Get.snackbar(AppConstants.myAppName,
            verificationCodeRequestModel!.responseMessage ?? "");
      }
    }
  }

  void countryCodePicker(String number) {
    countryCode = number.substring(1);
    update();
  }

  String verificationCodeInputGetter() {
    verificationCode = verifyControllerFirst.text +
        verifyControllerSecond.text +
        verifyControllerThird.text +
        verifyControllerFourth.text;
    update();
    return verificationCode;
  }

  Future<VerificationCodeResponseModel?> verifyUser() async {
    String verifyUserUrl =
        "${Service.userApi}?code=$verificationCode&phoneNumber=$countryCode${numberController.text}";
    Uri serviceUri = Uri.parse(Service.baseUrl + verifyUserUrl);
    http.Response response = await http.get(serviceUri);
    Map<String, dynamic> responseMap = jsonDecode(response.body);
    verificationCodeResponseModel =
        VerificationCodeResponseModel.fromJson(responseMap);
    return verificationCodeResponseModel;
  }

  bool userVerificationChecker()  {
    if (verificationCodeResponseModel != null) {
      if (verificationCodeResponseModel!.result == "Success") {
        Timer(
          const Duration(seconds: 1),
              () => Get.offAllNamed("/verified"),
        );
        return true;
      } else {
        Get.snackbar(AppConstants.myAppName,
            verificationCodeResponseModel!.responseMessage ?? "");
        return false;
      }
    }
    return false;
  }
}

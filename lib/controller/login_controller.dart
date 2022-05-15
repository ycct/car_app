import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
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

  void clearTextFields() {
    verifyControllerFirst.clear();
    verifyControllerSecond.clear();
    verifyControllerThird.clear();
    verifyControllerFourth.clear();
  }

  Future login() async {
    String getCodeUrl =
        "${Service.userApi}$countryCode${numberController.text}";
    Uri serviceUri = Uri.parse(Service.baseUrl + getCodeUrl);
    try {
      http.Response response = await http.get(serviceUri);
      Map<String, dynamic> responseMap = jsonDecode(response.body);
      verificationCodeRequestModel =
          VerificationCodeRequestModel.fromJson(responseMap);
    } catch (e) {
      Get.snackbar(
        "appName".tr,
        e.toString(),
      );
    }
  }

  Future loginRequestChecker() async {
    if (verificationCodeRequestModel != null) {
      if (verificationCodeRequestModel!.result == "Success") {
        Get.snackbar("appName".tr,
            verificationCodeRequestModel!.responseMessage ?? "",
            backgroundColor: Colors.blue.shade300, colorText: Colors.white);
        Timer(
          const Duration(milliseconds: 100),
          () => Get.toNamed("/verification"),
        );
      } else {
        Get.snackbar("appName".tr,
            verificationCodeRequestModel!.responseMessage ?? "",
            backgroundColor: Colors.blue.shade300, colorText: Colors.white,);
        await Future.delayed(
          const Duration(
            seconds: 2,
          ),
        );
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

  bool userVerificationChecker() {
    if (verificationCodeResponseModel != null) {
      if (verificationCodeResponseModel!.result == "Success") {
        Timer(
          const Duration(seconds: 1),
          () => Get.offAllNamed("/verified"),
        );
        return true;
      } else {
        Get.snackbar("appName".tr,
            verificationCodeResponseModel!.responseMessage ?? "",
            backgroundColor: Colors.blue.shade300, colorText: Colors.white,
        );
        return false;
      }
    }
    return false;
  }
}

import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:yallawashtest/constants/app_constants.dart';
import '../models/code_response_model.dart';

class LoginController extends GetxController {
  VerificationCodeResponseModel? verificationCodeResponseModel;
  TextEditingController numberController = TextEditingController();
  String countryCode = "249";

  Future<dynamic> login() async {
    const String baseUrl = "http://178.157.14.40:88";
    String getCodeUrl = "/api/users/$countryCode${numberController.text}";
    Uri serviceUri = Uri.parse(baseUrl + getCodeUrl);
    try {
      http.Response response = await http.get(serviceUri);
      Map<String, dynamic> responseMap = jsonDecode(response.body);
      verificationCodeResponseModel =
          VerificationCodeResponseModel.fromJson(responseMap);
      return verificationCodeResponseModel;
    } catch (e) {
      return e;
    }
  }

  Future loginResponseChecker() async {
    if (verificationCodeResponseModel != null) {
      if (verificationCodeResponseModel!.result == "Success") {
        Get.snackbar(AppConstants.myAppName,
            verificationCodeResponseModel!.responseMessage ?? "");
        Timer(
          const Duration(seconds: 2),
          () => Get.toNamed("/verification"),
        );
      } else {
        Get.snackbar(AppConstants.myAppName,
            verificationCodeResponseModel!.responseMessage ?? "");
      }
    }
  }

  void countryCodePicker(String number){
    countryCode = number.substring(1);
    update();
  }

}

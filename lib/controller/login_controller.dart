import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/ver_code_response_model.dart';

class LoginController extends GetxController {
  VerificationCodeResponseModel? verificationCodeResponseModel;
  TextEditingController numberController = TextEditingController();

  Future login() async {
    const String baseUrl = "http://178.157.14.40:88";
    const String getCodeUrl = "/api/users/249991009900";
    Uri serviceUri = Uri.parse(baseUrl + getCodeUrl);
    http.Response response = await http.get(serviceUri);
    Map<String, dynamic> responseMap = jsonDecode(response.body);
    verificationCodeResponseModel =
        VerificationCodeResponseModel.fromJson(responseMap);
    if (verificationCodeResponseModel != null) {
    }
  }
}

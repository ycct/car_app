import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/code_request_model.dart';
import '../models/code_response_model.dart';
import '../widgets/custom_snackbar.dart';

class ServiceConst {
  static const String baseUrl = "http://178.157.14.40:88";
  static const String userApi = "/api/users/";
}

class WebService {
  VerificationCodeRequestModel? verificationCodeRequestModel;
  VerificationCodeResponseModel? verificationCodeResponseModel;

  Future<List<VerificationCodeRequestModel>> fetchData(int quantity) async {
    List<VerificationCodeRequestModel> list = [];
    try {
      String getCodeUrl = ServiceConst.userApi;
      Uri serviceUri = Uri.parse(ServiceConst.baseUrl + getCodeUrl);
      http.Response response = await http.get(serviceUri);
      Map<String, dynamic> responseMap = jsonDecode(response.body);
      verificationCodeRequestModel =
          VerificationCodeRequestModel.fromJson(responseMap);
    } catch (e) {
      CustomSnackBar.showErrorMessage(e);
      debugPrint(e.toString());
      return [];
    }
    return list;
  }
}

import 'package:get/get.dart';
import 'package:yallawashtest/models/code_response_model.dart';
import '../models/code_request_model.dart';
import '../service/service.dart';
import '../utils/alert_enum.dart';
import '../widgets/custom_snackbar.dart';

enum Status { initial, loading, notFound, success }

class LoginController extends GetxController {
  VerificationCodeRequestModel? verificationCodeRequestModel;
  VerificationCodeResponseModel? verificationCodeResponseModel;
  String countryCode = "249";
  String verificationCode = "";
  Status status = Status.initial;

  @override
  onInit() async {
    super.onInit();
    await getData();
  }

  Future<void> getData() async {
    status = Status.loading;
    verificationCodeRequestModel = await WebService().fetchData();
    status =
        verificationCodeRequestModel == null ? Status.notFound : Status.success;
    status == Status.success
        ? CustomSnackBar.showSuccessMessage(AlertEnum.success.titleText)
        : null;
    update();
  }

  void countryCodePicker(String number) {
    countryCode = number.substring(1);
    update();
  }
}


class VerificationCodeResponseModel {
  final String? result;
  final String? responseMessage;
  // final CustomerModel? customer;

  VerificationCodeResponseModel(
      {this.result, this.responseMessage});

  factory VerificationCodeResponseModel.fromJson(Map<String, dynamic> json) {
    return VerificationCodeResponseModel(
      // customer: json["Customer"],
      result: json["Result"],
      responseMessage: json["ResponseMessage"],
    );
  }
}

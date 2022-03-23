class VerificationCodeRequestModel {
  final String? result;
  final String? responseMessage;
  final bool? isCustomerRegistered;

  VerificationCodeRequestModel(
      {this.result, this.responseMessage, this.isCustomerRegistered});

  factory VerificationCodeRequestModel.fromJson(Map<String, dynamic> json) {
    return VerificationCodeRequestModel(
      result: json["Result"],
      responseMessage: json["ResponseMessage"],
      isCustomerRegistered: json["isCustomerRegistered"],
    );
  }
}

class VerificationCodeResponseModel {
  final String? result;
  final String? responseMessage;
  final bool? isCustomerRegistered;

  VerificationCodeResponseModel(
      {this.result, this.responseMessage, this.isCustomerRegistered});

  factory VerificationCodeResponseModel.fromJson(Map<String, dynamic> json) {
    return VerificationCodeResponseModel(
      result: json["Result"],
      responseMessage: json["ResponseMessage"],
      isCustomerRegistered: json["isCustomerRegistered"],
    );
  }
}

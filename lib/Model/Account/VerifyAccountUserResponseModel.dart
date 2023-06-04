// To parse this JSON data, do
//
//     final verifyAccountUserResponseModel = verifyAccountUserResponseModelFromJson(jsonString);

import 'dart:convert';

VerifyAccountUserResponseModel verifyAccountUserResponseModelFromJson(String str) => VerifyAccountUserResponseModel.fromJson(json.decode(str));

String verifyAccountUserResponseModelToJson(VerifyAccountUserResponseModel data) => json.encode(data.toJson());

class VerifyAccountUserResponseModel {
    String accountNumber;
    String bankName;
    String bankCode;
    String accountName;

    VerifyAccountUserResponseModel({
        required this.accountNumber,
        required this.bankName,
        required this.bankCode,
        required this.accountName,
    });

    factory VerifyAccountUserResponseModel.fromJson(Map<String, dynamic> json) => VerifyAccountUserResponseModel(
        accountNumber: json["account_number"],
        bankName: json["bank_name"],
        bankCode: json["bank_code"],
        accountName: json["AccountName"],
    );

    Map<String, dynamic> toJson() => {
        "account_number": accountNumber,
        "bank_name": bankName,
        "bank_code": bankCode,
        "AccountName": accountName,
    };
}

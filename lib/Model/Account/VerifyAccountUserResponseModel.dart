// To parse this JSON data, do
//
//     final verifyAccountUserResponseModel = verifyAccountUserResponseModelFromJson(jsonString);

import 'dart:convert';

VerifyAccountUserResponseModel verifyAccountUserResponseModelFromJson(String str) => VerifyAccountUserResponseModel.fromJson(json.decode(str));

String verifyAccountUserResponseModelToJson(VerifyAccountUserResponseModel data) => json.encode(data.toJson());

class VerifyAccountUserResponseModel {
    String? accountNumber;
    String? bankName;
    String? bankCode;
    String? accountName;

    VerifyAccountUserResponseModel({
        this.accountNumber,
        this.bankName,
        this.bankCode,
        this.accountName,
    });

    factory VerifyAccountUserResponseModel.fromJson(Map<String, dynamic> json) => VerifyAccountUserResponseModel(
        accountNumber: json["account_number"],
        bankName: json["bank_name"],
        bankCode: json["bank_code"],
        accountName: json["accountName"],
    );

    Map<String, dynamic> toJson() => {
        "account_number": accountNumber,
        "bank_name": bankName,
        "bank_code": bankCode,
        "accountName": accountName,
    };
}

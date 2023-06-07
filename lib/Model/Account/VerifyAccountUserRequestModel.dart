// To parse this JSON data, do
//
//     final verifyAccountUserRequestModel = verifyAccountUserRequestModelFromJson(jsonString);

import 'dart:convert';

VerifyAccountUserRequestModel verifyAccountUserRequestModelFromJson(String str) => VerifyAccountUserRequestModel.fromJson(json.decode(str));

String verifyAccountUserRequestModelToJson(VerifyAccountUserRequestModel data) => json.encode(data.toJson());

class VerifyAccountUserRequestModel {
    String accountNumber;
    String bankName;

    VerifyAccountUserRequestModel({
        required this.accountNumber,
        required this.bankName,
    });

    factory VerifyAccountUserRequestModel.fromJson(Map<String, dynamic> json) => VerifyAccountUserRequestModel(
        accountNumber: json["account_number"],
        bankName: json["bank_name"],
    );

    Map<String, dynamic> toJson() => {
        "account_number": accountNumber,
        "bank_name": bankName,
    };
}

// To parse this JSON data, do
//
//     final bank = bankFromJson(jsonString);

import 'dart:convert';

List<Bank> bankFromJson(String str) => List<Bank>.from(json.decode(str).map((x) => Bank.fromJson(x)));

String bankToJson(List<Bank> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Bank {
    String? bankName;
    String? bankCode;

    Bank({
        this.bankName,
        this.bankCode,
    });

    factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        bankName: json["bankName"],
        bankCode: json["bankCode"],
    );

    Map<String, dynamic> toJson() => {
        "bankName": bankName,
        "bankCode": bankCode,
    };
}

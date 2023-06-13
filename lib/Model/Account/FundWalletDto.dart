// To parse this JSON data, do
//
//     final fundWalletDto = fundWalletDtoFromJson(jsonString);

import 'dart:convert';

FundWalletDto fundWalletDtoFromJson(String str) => FundWalletDto.fromJson(json.decode(str));

String fundWalletDtoToJson(FundWalletDto data) => json.encode(data.toJson());

class FundWalletDto {
    String? fullName;
    String? accountNumber;
    String? bankName;

    FundWalletDto({
        this.fullName,
        this.accountNumber,
        this.bankName,
    });

    factory FundWalletDto.fromJson(Map<String, dynamic> json) => FundWalletDto(
        fullName: json["FullName"],
        accountNumber: json["accountNumber"],
        bankName: json["BankName"],
    );

    Map<String, dynamic> toJson() => {
        "FullName": fullName,
        "accountNumber": accountNumber,
        "BankName": bankName,
    };
}

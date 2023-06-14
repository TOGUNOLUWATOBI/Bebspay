// To parse this JSON data, do
//
//     final accountDetails = accountDetailsFromJson(jsonString);

import 'dart:convert';

AccountDetails accountDetailsFromJson(String str) => AccountDetails.fromJson(json.decode(str));

String accountDetailsToJson(AccountDetails data) => json.encode(data.toJson());

class AccountDetails {
    String? fullName;
    int? tier;
    int? limit;
    String? accountNumber;
    String? bankName;

    AccountDetails({
        this.fullName,
        this.tier,
        this.limit,
        this.accountNumber,
        this.bankName,
    });

    factory AccountDetails.fromJson(Map<String, dynamic> json) => AccountDetails(
        fullName: json["fullName"],
        tier: json["tier"],
        limit: json["limit"],
        accountNumber: json["accountNumber"],
        bankName: json["bankName"],
    );

    Map<String, dynamic> toJson() => {
        "FullName": fullName,
        "Tier": tier,
        "Limit": limit,
        "accountNumber": accountNumber,
        "BankName": bankName,
    };
}

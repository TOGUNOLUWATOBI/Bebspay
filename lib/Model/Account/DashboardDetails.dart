// To parse this JSON data, do
//
//     final dashboardDetails = dashboardDetailsFromJson(jsonString);

import 'dart:convert';

import 'TransactionDto.dart';

DashboardDetails dashboardDetailsFromJson(String str) => DashboardDetails.fromJson(json.decode(str));

String dashboardDetailsToJson(DashboardDetails data) => json.encode(data.toJson());

class DashboardDetails {
    String? name;
    String? profilePicture;
    double? balance;
    List<TransactionDto>? transactions;

    DashboardDetails({
        this.name,
        this.balance,
        this.transactions,
        this.profilePicture
    });

    factory DashboardDetails.fromJson(Map<String, dynamic> json) => DashboardDetails(
        name: json["name"],
        profilePicture: json["profilePicture"],
        balance: json["balance"],
        transactions: List<TransactionDto>.from(json["transactions"].map((x) => TransactionDto.fromJson(x))).toList(),
    );

    Map<String, dynamic> toJson() => {
        "Name": name,
        "ProfilePicture": profilePicture,
        "Balance": balance,
        "Transactions": List<dynamic>.from(transactions!.map((x) => x.toJson())),
    };
}

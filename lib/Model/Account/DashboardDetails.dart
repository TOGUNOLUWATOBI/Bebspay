// To parse this JSON data, do
//
//     final dashboardDetails = dashboardDetailsFromJson(jsonString);

import 'dart:convert';

import 'TransactionDto.dart';

DashboardDetails dashboardDetailsFromJson(String str) => DashboardDetails.fromJson(json.decode(str));

String dashboardDetailsToJson(DashboardDetails data) => json.encode(data.toJson());

class DashboardDetails {
    String? name;
    int? balance;
    List<TransactionDto>? transactions;

    DashboardDetails({
        this.name,
        this.balance,
        this.transactions,
    });

    factory DashboardDetails.fromJson(Map<String, dynamic> json) => DashboardDetails(
        name: json["Name"],
        balance: json["Balance"],
        transactions: List<TransactionDto>.from(json["Transactions"].map((x) => TransactionDto.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Name": name,
        "Balance": balance,
        "Transactions": List<dynamic>.from(transactions!.map((x) => x.toJson())),
    };
}

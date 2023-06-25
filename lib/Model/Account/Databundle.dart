// To parse this JSON data, do
//
//     final dataBundle = dataBundleFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DataBundle dataBundleFromJson(String str) => DataBundle.fromJson(json.decode(str));

String dataBundleToJson(DataBundle data) => json.encode(data.toJson());

class DataBundle {
    int id;
    String billerCode;
    String name;
    double defaultCommission;
    DateTime dateAdded;
    String country;
    bool isAirtime;
    String billerName;
    String itemCode;
    String shortName;
    int fee;
    bool commissionOnFee;
    String labelName;
    int amount;

    DataBundle({
        required this.id,
        required this.billerCode,
        required this.name,
        required this.defaultCommission,
        required this.dateAdded,
        required this.country,
        required this.isAirtime,
        required this.billerName,
        required this.itemCode,
        required this.shortName,
        required this.fee,
        required this.commissionOnFee,
        required this.labelName,
        required this.amount,
    });

    factory DataBundle.fromJson(Map<String, dynamic> json) => DataBundle(
        id: json["id"],
        billerCode: json["biller_code"],
        name: json["name"],
        defaultCommission: json["default_commission"].toDouble(),
        dateAdded: DateTime.parse(json["date_added"]),
        country: json["country"],
        isAirtime: json["is_airtime"],
        billerName: json["biller_name"],
        itemCode: json["item_code"],
        shortName: json["short_name"],
        fee: json["fee"],
        commissionOnFee: json["commission_on_fee"],
        labelName: json["label_name"],
        amount: json["amount"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "biller_code": billerCode,
        "name": name,
        "default_commission": defaultCommission,
        "date_added": dateAdded.toIso8601String(),
        "country": country,
        "is_airtime": isAirtime,
        "biller_name": billerName,
        "item_code": itemCode,
        "short_name": shortName,
        "fee": fee,
        "commission_on_fee": commissionOnFee,
        "label_name": labelName,
        "amount": amount,
    };
}

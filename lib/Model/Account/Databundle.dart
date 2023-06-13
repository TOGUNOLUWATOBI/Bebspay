// To parse this JSON data, do
//
//     final dataBundle = dataBundleFromJson(jsonString);

import 'dart:convert';

DataBundle dataBundleFromJson(String str) => DataBundle.fromJson(json.decode(str));

String dataBundleToJson(DataBundle data) => json.encode(data.toJson());

class DataBundle {
    String? status;
    String? message;
    List<BillCategories>? data;

    DataBundle({
        this.status,
        this.message,
        this.data,
    });

    factory DataBundle.fromJson(Map<String, dynamic> json) => DataBundle(
        status: json["status"],
        message: json["message"],
        data: List<BillCategories>.from(json["data"].map((x) => BillCategories.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class BillCategories {
    int? id;
    String? billerCode;
    String? name;
    int? defaultCommission;
    String? dateAdded;
    String? country;
    bool? isAirtime;
    String? billerName;
    String? itemCode;
    String? shortName;
    int? fee;
    bool? commissionOnFee;
    String? labelName;
    int? amount;

    BillCategories({
        this.id,
        this.billerCode,
        this.name,
        this.defaultCommission,
        this.dateAdded,
        this.country,
        this.isAirtime,
        this.billerName,
        this.itemCode,
        this.shortName,
        this.fee,
        this.commissionOnFee,
        this.labelName,
        this.amount,
    });

    factory BillCategories.fromJson(Map<String, dynamic> json) => BillCategories(
        id: json["id"],
        billerCode: json["biller_code"],
        name: json["name"],
        defaultCommission: json["default_commission"],
        dateAdded: json["date_added"],
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
        "date_added": dateAdded,
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

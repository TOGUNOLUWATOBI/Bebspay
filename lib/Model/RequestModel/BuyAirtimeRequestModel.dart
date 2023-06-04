// To parse this JSON data, do
//
//     final buyAirtimeRequestModel = buyAirtimeRequestModelFromJson(jsonString);

import 'dart:convert';

BuyAirtimeRequestModel buyAirtimeRequestModelFromJson(String str) => BuyAirtimeRequestModel.fromJson(json.decode(str));

String buyAirtimeRequestModelToJson(BuyAirtimeRequestModel data) => json.encode(data.toJson());

class BuyAirtimeRequestModel {
    String country;
    String customer;
    String type;
    int amount;
    int trxAmount;
    int transferAmount;
    String recurrence;
    String reference;
    String longitude;
    String latitude;

    BuyAirtimeRequestModel({
        required this.country,
        required this.customer,
        required this.type,
        required this.amount,
        required this.trxAmount,
        required this.transferAmount,
        required this.recurrence,
        required this.reference,
        required this.longitude,
        required this.latitude,
    });

    factory BuyAirtimeRequestModel.fromJson(Map<String, dynamic> json) => BuyAirtimeRequestModel(
        country: json["Country"],
        customer: json["Customer"],
        type: json["Type"],
        amount: json["Amount"],
        trxAmount: json["TrxAmount"],
        transferAmount: json["TransferAmount"],
        recurrence: json["Recurrence"],
        reference: json["Reference"],
        longitude: json["longitude"],
        latitude: json["latitude"],
    );

    Map<String, dynamic> toJson() => {
        "Country": country,
        "Customer": customer,
        "Type": type,
        "Amount": amount,
        "TrxAmount": trxAmount,
        "TransferAmount": transferAmount,
        "Recurrence": recurrence,
        "Reference": reference,
        "longitude": longitude,
        "latitude": latitude,
    };
}

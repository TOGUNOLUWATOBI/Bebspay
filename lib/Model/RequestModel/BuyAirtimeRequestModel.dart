// To parse this JSON data, do
//
//     final buyAirtimeRequestModel = buyAirtimeRequestModelFromJson(jsonString);

import 'dart:convert';

BuyAirtimeRequestModel buyAirtimeRequestModelFromJson(String str) => BuyAirtimeRequestModel.fromJson(json.decode(str));

String buyAirtimeRequestModelToJson(BuyAirtimeRequestModel data) => json.encode(data.toJson());

class BuyAirtimeRequestModel {
    
    String customer;
    String type;
    int amount;
    int trxAmount;
    int transferAmount;
    String longitude;
    String latitude;

    BuyAirtimeRequestModel({
        
        required this.customer,
        required this.type,
        required this.amount,
        required this.trxAmount,
        required this.transferAmount,
        required this.longitude,
        required this.latitude,
    });

    factory BuyAirtimeRequestModel.fromJson(Map<String, dynamic> json) => BuyAirtimeRequestModel(
        
        customer: json["Customer"],
        type: json["Type"],
        amount: json["Amount"],
        trxAmount: json["TrxAmount"],
        transferAmount: json["TransferAmount"],
        
        longitude: json["longitude"],
        latitude: json["latitude"],
    );

    Map<String, dynamic> toJson() => {
        
        "Customer": customer,
        "Type": type,
        "Amount": amount,
        "TrxAmount": trxAmount,
        "TransferAmount": transferAmount,
        
        "longitude": longitude,
        "latitude": latitude,
    };
}

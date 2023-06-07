// To parse this JSON data, do
//
//     final AddTransactionPinModel = AddTransactionPinModelFromJson(jsonString);

import 'dart:convert';

AddTransactionPinModel AddTransactionPinModelFromJson(String str) => AddTransactionPinModel.fromJson(json.decode(str));

String AddTransactionPinModelToJson(AddTransactionPinModel data) => json.encode(data.toJson());

class AddTransactionPinModel {
    String trxPin;

    AddTransactionPinModel({
        required this.trxPin,
    });

    factory AddTransactionPinModel.fromJson(Map<String, dynamic> json) => AddTransactionPinModel(
        trxPin: json["TrxPin"],
    );

    Map<String, dynamic> toJson() => {
        "TrxPin": trxPin,
    };
}

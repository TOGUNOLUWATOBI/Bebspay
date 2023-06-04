// To parse this JSON data, do
//
//     final changeTransactionPinModel = changeTransactionPinModelFromJson(jsonString);

import 'dart:convert';

ChangeTransactionPinModel changeTransactionPinModelFromJson(String str) => ChangeTransactionPinModel.fromJson(json.decode(str));

String changeTransactionPinModelToJson(ChangeTransactionPinModel data) => json.encode(data.toJson());

class ChangeTransactionPinModel {
    String oldTrxPin;
    String newTrxPin;

    ChangeTransactionPinModel({
        required this.oldTrxPin,
        required this.newTrxPin,
    });

    factory ChangeTransactionPinModel.fromJson(Map<String, dynamic> json) => ChangeTransactionPinModel(
        oldTrxPin: json["OldTrxPin"],
        newTrxPin: json["NewTrxPin"],
    );

    Map<String, dynamic> toJson() => {
        "OldTrxPin": oldTrxPin,
        "NewTrxPin": newTrxPin,
    };
}

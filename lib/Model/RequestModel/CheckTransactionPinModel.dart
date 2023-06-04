// To parse this JSON data, do
//
//     final checkTransactionPinModel = checkTransactionPinModelFromJson(jsonString);

import 'dart:convert';

CheckTransactionPinModel checkTransactionPinModelFromJson(String str) => CheckTransactionPinModel.fromJson(json.decode(str));

String checkTransactionPinModelToJson(CheckTransactionPinModel data) => json.encode(data.toJson());

class CheckTransactionPinModel {
    String trxPin;

    CheckTransactionPinModel({
        required this.trxPin,
    });

    factory CheckTransactionPinModel.fromJson(Map<String, dynamic> json) => CheckTransactionPinModel(
        trxPin: json["TrxPin"],
    );

    Map<String, dynamic> toJson() => {
        "TrxPin": trxPin,
    };
}

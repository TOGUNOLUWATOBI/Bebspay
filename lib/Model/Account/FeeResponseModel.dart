// To parse this JSON data, do
//
//     final feeResponseModel = feeResponseModelFromJson(jsonString);

import 'dart:convert';

FeeResponseModel feeResponseModelFromJson(String str) => FeeResponseModel.fromJson(json.decode(str));

String feeResponseModelToJson(FeeResponseModel data) => json.encode(data.toJson());

class FeeResponseModel {
    String? status;
    String? message;
    List<Datum>? data;

    FeeResponseModel({
        this.status,
        this.message,
        this.data,
    });

    factory FeeResponseModel.fromJson(Map<String, dynamic> json) => FeeResponseModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? currency;
    String? feeType;
    double? fee;

    Datum({
        this.currency,
        this.feeType,
        this.fee,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        currency: json["currency"],
        feeType: json["fee_type"],
        fee: json["fee"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "currency": currency,
        "fee_type": feeType,
        "fee": fee,
    };
}

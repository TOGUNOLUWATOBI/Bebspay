// To parse this JSON data, do
//
//     final transferRequestModel = transferRequestModelFromJson(jsonString);

import 'dart:convert';

TransferRequestModel transferRequestModelFromJson(String str) => TransferRequestModel.fromJson(json.decode(str));

String transferRequestModelToJson(TransferRequestModel data) => json.encode(data.toJson());

class TransferRequestModel {
    int amount;
    int trxAmount;
    String description;
    String beneficiaryName;
    String beneficiaryAccountNumber;
    String beneficiaryBank;
    String beneficiaryBankCode;
    String latitude;
    String longitude;

    TransferRequestModel({
        required this.amount,
        required this.trxAmount,
        required this.description,
        required this.beneficiaryName,
        required this.beneficiaryAccountNumber,
        required this.beneficiaryBank,
        required this.beneficiaryBankCode,
        required this.latitude,
        required this.longitude,
    });

    factory TransferRequestModel.fromJson(Map<String, dynamic> json) => TransferRequestModel(
        amount: json["Amount"],
        trxAmount: json["TrxAmount"],
        description: json["Description"],
        beneficiaryName: json["BeneficiaryName"],
        beneficiaryAccountNumber: json["BeneficiaryAccountNumber"],
        beneficiaryBank: json["BeneficiaryBank"],
        beneficiaryBankCode: json["BeneficiaryBankCode"],
        latitude: json["latitude"],
        longitude: json["longitude"],
    );

    Map<String, dynamic> toJson() => {
        "Amount": amount,
        "TrxAmount": trxAmount,
        "Description": description,
        "BeneficiaryName": beneficiaryName,
        "BeneficiaryAccountNumber": beneficiaryAccountNumber,
        "BeneficiaryBank": beneficiaryBank,
        "BeneficiaryBankCode": beneficiaryBankCode,
        "latitude": latitude,
        "longitude": longitude,
    };
}

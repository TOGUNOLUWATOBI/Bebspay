// To parse this JSON data, do
//
//     final transactionDto = transactionDtoFromJson(jsonString);

import 'dart:convert';

TransactionDto transactionDtoFromJson(String str) => TransactionDto.fromJson(json.decode(str));

String transactionDtoToJson(TransactionDto data) => json.encode(data.toJson());

class TransactionDto {
    int? amount;
    String? reference;
    String? id;
    DateTime? creationDate;
    String? postingType;
    String? transactionType;
    String? status;
    String? beneficiary;
    String? beneficiaryName;
    String? beneficiaryAccountNumber;
    String? beneficiaryBank;
    String? phoneNumber;

    TransactionDto({
         this.amount,
         this.reference,
         this.id,
         this.creationDate,
         this.postingType,
         this.transactionType,
         this.status,
         this.beneficiary,
         this.beneficiaryName,
         this.beneficiaryAccountNumber,
         this.beneficiaryBank,
         this.phoneNumber,
    });

    factory TransactionDto.fromJson(Map<String, dynamic> json) => TransactionDto(
        amount: json["Amount"],
        reference: json["Reference"],
        id: json["Id"],
        creationDate: DateTime.tryParse(json["CreationDate"]),
        postingType: json["PostingType"],
        transactionType: json["TransactionType"],
        status: json["Status"],
        beneficiary: json["Beneficiary"],
        beneficiaryName: json["BeneficiaryName"],
        beneficiaryAccountNumber: json["BeneficiaryAccountNumber"],
        beneficiaryBank: json["BeneficiaryBank"],
        phoneNumber: json["PhoneNumber"],
    );

    Map<String, dynamic> toJson() => {
        "Amount": amount,
        "Reference": reference,
        "Id": id,
        "CreationDate": creationDate,
        "PostingType": postingType,
        "TransactionType": transactionType,
        "Status": status,
        "Beneficiary": beneficiary,
        "BeneficiaryName": beneficiaryName,
        "BeneficiaryAccountNumber": beneficiaryAccountNumber,
        "BeneficiaryBank": beneficiaryBank,
        "PhoneNumber": phoneNumber,
    };
}

// To parse this JSON data, do
//
//     final transactionDto = transactionDtoFromJson(jsonString);

import 'dart:convert';

TransactionDto transactionDtoFromJson(String str) => TransactionDto.fromJson(json.decode(str));

String transactionDtoToJson(TransactionDto data) => json.encode(data.toJson());

class TransactionDto {
    double? amount;
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
    String? createdDate;
    String? createdTime;

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
         this.createdDate,
         this.createdTime
    });

    factory TransactionDto.fromJson(Map<String, dynamic> json) => TransactionDto(
        amount: json["amount"],
        reference: json["reference"],
        id: json["id"],
        creationDate: DateTime.now(),
        postingType: json["postingType"],
        transactionType: json["transactionType"],
        status: json["status"],
        beneficiary: json["beneficiary"],
        beneficiaryName: json["beneficiaryName"],
        beneficiaryAccountNumber: json["beneficiaryAccountNumber"],
        beneficiaryBank: json["beneficiaryBank"],
        phoneNumber: json["phoneNumber"],
        createdDate: json["createdDate"],
        createdTime: json["createdTime"]
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
        "CreatedDate": createdDate,
        "CreatedTime": createdTime
    };
}

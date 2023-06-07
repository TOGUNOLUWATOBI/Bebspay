// To parse this JSON data, do
//
//     final changePanicPinModel = changePanicPinModelFromJson(jsonString);

import 'dart:convert';

ChangePanicPinModel changePanicPinModelFromJson(String str) => ChangePanicPinModel.fromJson(json.decode(str));

String changePanicPinModelToJson(ChangePanicPinModel data) => json.encode(data.toJson());

class ChangePanicPinModel {
    String oldPanicPin;
    String newPanicPin;

    ChangePanicPinModel({
        required this.oldPanicPin,
        required this.newPanicPin,
    });

    factory ChangePanicPinModel.fromJson(Map<String, dynamic> json) => ChangePanicPinModel(
        oldPanicPin: json["OldPanicPin"],
        newPanicPin: json["NewPanicPin"],
    );

    Map<String, dynamic> toJson() => {
        "OldPanicPin": oldPanicPin,
        "NewPanicPin": newPanicPin,
    };
}

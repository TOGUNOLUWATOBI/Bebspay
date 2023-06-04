// To parse this JSON data, do
//
//     final addPanicPinModel = addPanicPinModelFromJson(jsonString);

import 'dart:convert';

AddPanicPinModel addPanicPinModelFromJson(String str) => AddPanicPinModel.fromJson(json.decode(str));

String addPanicPinModelToJson(AddPanicPinModel data) => json.encode(data.toJson());

class AddPanicPinModel {
    String panicPin;

    AddPanicPinModel({
        required this.panicPin,
    });

    factory AddPanicPinModel.fromJson(Map<String, dynamic> json) => AddPanicPinModel(
        panicPin: json["PanicPin"],
    );

    Map<String, dynamic> toJson() => {
        "PanicPin": panicPin,
    };
}

// To parse this JSON data, do
//
//     final changePasswordRequestModel = changePasswordRequestModelFromJson(jsonString);

import 'dart:convert';

ChangePasswordRequestModel changePasswordRequestModelFromJson(String str) => ChangePasswordRequestModel.fromJson(json.decode(str));

String changePasswordRequestModelToJson(ChangePasswordRequestModel data) => json.encode(data.toJson());

class ChangePasswordRequestModel {
    
    String password;

    ChangePasswordRequestModel({
        
        required this.password,
    });

    factory ChangePasswordRequestModel.fromJson(Map<String, dynamic> json) => ChangePasswordRequestModel(
        
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        
        "Password": password,
    };
}

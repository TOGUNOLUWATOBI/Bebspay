// To parse this JSON data, do
//
//     final changePasswordRequestModel = changePasswordRequestModelFromJson(jsonString);

import 'dart:convert';

ChangePasswordRequestModel changePasswordRequestModelFromJson(String str) => ChangePasswordRequestModel.fromJson(json.decode(str));

String changePasswordRequestModelToJson(ChangePasswordRequestModel data) => json.encode(data.toJson());

class ChangePasswordRequestModel {
    String email;
    String password;

    ChangePasswordRequestModel({
        required this.email,
        required this.password,
    });

    factory ChangePasswordRequestModel.fromJson(Map<String, dynamic> json) => ChangePasswordRequestModel(
        email: json["Email"],
        password: json["Password"],
    );

    Map<String, dynamic> toJson() => {
        "Email": email,
        "Password": password,
    };
}

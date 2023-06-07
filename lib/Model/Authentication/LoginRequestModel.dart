// To parse this JSON data, do
//
//     final loginRequestModel = loginRequestModelFromJson(jsonString);

import 'dart:convert';

LoginRequestModel loginRequestModelFromJson(String str) => LoginRequestModel.fromJson(json.decode(str));

String loginRequestModelToJson(LoginRequestModel data) => json.encode(data.toJson());

class LoginRequestModel {
    String emailAddress;
    String password;

    LoginRequestModel({
        required this.emailAddress,
        required this.password,
    });

    factory LoginRequestModel.fromJson(Map<String, dynamic> json) => LoginRequestModel(
        emailAddress: json["EmailAddress"],
        password: json["Password"],
    );

    Map<String, dynamic> toJson() => {
        "EmailAddress": emailAddress,
        "Password": password,
    };
}

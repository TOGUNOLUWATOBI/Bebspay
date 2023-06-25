// To parse this JSON data, do
//
//     final signUpRequestModel = signUpRequestModelFromJson(jsonString);

import 'dart:convert';

SignUpRequestModel signUpRequestModelFromJson(String str) => SignUpRequestModel.fromJson(json.decode(str));

String signUpRequestModelToJson(SignUpRequestModel data) => json.encode(data.toJson());

class SignUpRequestModel {
    String firstname;
    String lastname;
    String email;
    String password;
    String phoneNumber;
    String lga;
    String address;
    String state;
    String gender;
    bool isAndroid;

    SignUpRequestModel({
        required this.firstname,
        required this.lastname,
        required this.email,
        required this.password,
        required this.phoneNumber,
        required this.lga,
        required this.address,
        required this.state,
        required this.gender,
        required this.isAndroid
    });

    factory SignUpRequestModel.fromJson(Map<String, dynamic> json) => SignUpRequestModel(
        firstname: json["Firstname"],
        lastname: json["Lastname"],
        email: json["Email"],
        password: json["Password"],
        phoneNumber: json["PhoneNumber"],
        lga: json["LGA"],
        address: json["Address"],
        state: json["State"],
        gender: json["Gender"],
        isAndroid : json["isAndroid"]
    );

    Map<String, dynamic> toJson() => {
        "Firstname": firstname,
        "Lastname": lastname,
        "Email": email,
        "Password": password,
        "PhoneNumber": phoneNumber,
        "LGA": lga,
        "Address": address,
        "State": state,
        "Gender": gender,
        "isAndroid" : isAndroid
    };
}

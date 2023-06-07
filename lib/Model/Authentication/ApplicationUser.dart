// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    dynamic password;
    String firstName;
    String lastName;
    String address;
    String lga;
    int saltProperty;
    dynamic transactionPin;
    dynamic panicPin;
    int pinTries;
    bool isPinSet;
    String state;
    String gender;
    String status;
    dynamic proficePictureId;
    bool isKycComplete;
    bool isAndroidDevice;
    dynamic deviceToken;
    dynamic creationDate;
    dynamic lastModifiedDate;
    String id;
    String userName;
    String normalizedUserName;
    String email;
    String normalizedEmail;
    bool emailConfirmed;
    String passwordHash;
    String securityStamp;
    String concurrencyStamp;
    String phoneNumber;
    bool phoneNumberConfirmed;
    bool twoFactorEnabled;
    dynamic lockoutEnd;
    bool lockoutEnabled;
    int accessFailedCount;

    User({
        this.password,
        required this.firstName,
        required this.lastName,
        required this.address,
        required this.lga,
        required this.saltProperty,
        this.transactionPin,
        this.panicPin,
        required this.pinTries,
        required this.isPinSet,
        required this.state,
        required this.gender,
        required this.status,
        this.proficePictureId,
        required this.isKycComplete,
        required this.isAndroidDevice,
        this.deviceToken,
        this.creationDate,
        this.lastModifiedDate,
        required this.id,
        required this.userName,
        required this.normalizedUserName,
        required this.email,
        required this.normalizedEmail,
        required this.emailConfirmed,
        required this.passwordHash,
        required this.securityStamp,
        required this.concurrencyStamp,
        required this.phoneNumber,
        required this.phoneNumberConfirmed,
        required this.twoFactorEnabled,
        this.lockoutEnd,
        required this.lockoutEnabled,
        required this.accessFailedCount,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        password: json["password"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        address: json["address"],
        lga: json["lga"],
        saltProperty: json["saltProperty"],
        transactionPin: json["transactionPIN"],
        panicPin: json["panicPIN"],
        pinTries: json["pinTries"],
        isPinSet: json["isPINSet"],
        state: json["state"],
        gender: json["gender"],
        status: json["status"],
        proficePictureId: json["proficePictureId"],
        isKycComplete: json["isKYCComplete"],
        isAndroidDevice: json["isAndroidDevice"],
        deviceToken: json["deviceToken"],
        creationDate: json["creationDate"],
        lastModifiedDate: json["lastModifiedDate"],
        id: json["id"],
        userName: json["userName"],
        normalizedUserName: json["normalizedUserName"],
        email: json["email"],
        normalizedEmail: json["normalizedEmail"],
        emailConfirmed: json["emailConfirmed"],
        passwordHash: json["passwordHash"],
        securityStamp: json["securityStamp"],
        concurrencyStamp: json["concurrencyStamp"],
        phoneNumber: json["phoneNumber"],
        phoneNumberConfirmed: json["phoneNumberConfirmed"],
        twoFactorEnabled: json["twoFactorEnabled"],
        lockoutEnd: json["lockoutEnd"],
        lockoutEnabled: json["lockoutEnabled"],
        accessFailedCount: json["accessFailedCount"],
    );

    Map<String, dynamic> toJson() => {
        "password": password,
        "firstName": firstName,
        "lastName": lastName,
        "address": address,
        "lga": lga,
        "saltProperty": saltProperty,
        "transactionPIN": transactionPin,
        "panicPIN": panicPin,
        "pinTries": pinTries,
        "isPINSet": isPinSet,
        "state": state,
        "gender": gender,
        "status": status,
        "proficePictureId": proficePictureId,
        "isKYCComplete": isKycComplete,
        "isAndroidDevice": isAndroidDevice,
        "deviceToken": deviceToken,
        "creationDate": creationDate,
        "lastModifiedDate": lastModifiedDate,
        "id": id,
        "userName": userName,
        "normalizedUserName": normalizedUserName,
        "email": email,
        "normalizedEmail": normalizedEmail,
        "emailConfirmed": emailConfirmed,
        "passwordHash": passwordHash,
        "securityStamp": securityStamp,
        "concurrencyStamp": concurrencyStamp,
        "phoneNumber": phoneNumber,
        "phoneNumberConfirmed": phoneNumberConfirmed,
        "twoFactorEnabled": twoFactorEnabled,
        "lockoutEnd": lockoutEnd,
        "lockoutEnabled": lockoutEnabled,
        "accessFailedCount": accessFailedCount,
    };
}


import 'dart:convert';

SaveFcmTokenModel SaveFcmTokenModelFromJson(String str) => SaveFcmTokenModel.fromJson(json.decode(str));

String SaveFcmTokenModelToJson(SaveFcmTokenModel data) => json.encode(data.toJson());

class SaveFcmTokenModel {
    String token;

    SaveFcmTokenModel({
        required this.token,
    });

    factory SaveFcmTokenModel.fromJson(Map<String, dynamic> json) => SaveFcmTokenModel(
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
    };
}

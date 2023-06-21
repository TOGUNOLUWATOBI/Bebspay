
import 'dart:convert';
LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
    String? email;
    String? accessToken;
    String? tokenType;
    DateTime? expiresIn;
    bool? isKycComplete;

    LoginResponseModel({this.email, this.accessToken, this.tokenType, this.expiresIn}); 

    LoginResponseModel.fromJson(Map<String, dynamic> json) {
        email = json['email'];
        accessToken = json['accessToken'];
        tokenType = json['tokenType'];
        expiresIn = DateTime.tryParse(json['expiresIn']);
        isKycComplete = json['isKycComplete'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['email'] = email;
        data['accessToken'] = accessToken;
        data['tokenType'] = tokenType;
        data['expiresIn'] = expiresIn;
        data['isKycComplete'] = isKycComplete;
        return data;
    }
}

import 'dart:convert';
LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
    String? email;
    String? accessToken;
    String? tokenType;
    DateTime? expiresIn;

    LoginResponseModel({this.email, this.accessToken, this.tokenType, this.expiresIn}); 

    LoginResponseModel.fromJson(Map<String, dynamic> json) {
        email = json['Email'];
        accessToken = json['AccessToken'];
        tokenType = json['TokenType'];
        expiresIn = json['ExpiresIn'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['Email'] = email;
        data['AccessToken'] = accessToken;
        data['TokenType'] = tokenType;
        data['ExpiresIn'] = expiresIn;
        return data;
    }
}
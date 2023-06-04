
import 'dart:convert';

ApiResponse apiResponseFromJson(String str) => ApiResponse.fromJson(json.decode(str));

String apiResponseToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse {
    String? message;
    String? code;
    dynamic data;
    String? statusCode;
    

    ApiResponse({
        this.message,
        this.code,
        required this.data,
        this.statusCode
    });

    factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        message: json["message"],
        code: json["code"],
        data: json["data"],
        statusCode: json["statusCode"],
       
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "code": code,
        "data": data,
        "statusCode": statusCode,       
    };
}
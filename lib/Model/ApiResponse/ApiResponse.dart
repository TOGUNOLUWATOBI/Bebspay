
import 'dart:convert';

ApiResponse apiResponseFromJson(String str) => ApiResponse.fromJson(json.decode(str));

String apiResponseToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse {
    String? message;
    int? code;
    String? status;
    dynamic data;
    String? statusCode;
    

    ApiResponse({
        this.message,
        this.code,
        required this.data,
        this.status,
        this.statusCode
    });

    factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        message: json["message"],
        code: json["code"],
        data: json["data"],
        status: json["status"],
        statusCode: json["statusCode"],
       
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "code": code,
        "data": data,
        "status": status,
        "statusCode": statusCode,       
    };
}
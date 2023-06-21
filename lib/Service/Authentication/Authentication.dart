import 'dart:io';

import 'package:app/Model/Authentication/LoginRequestModel.dart';
import 'package:app/Model/RequestModel/ChangePasswordRequestModel.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import '../../Model/ApiResponse/ApiResponse.dart';
import '../../Model/Authentication/LoginResponseModel.dart';
import '../../Model/Authentication/UserDto.dart';
import '../../Model/Authentication/SignUpRequestModel.dart';

Map<String, String> headers = {
  'Content-Type': 'application/json',
};

Future<LoginResponseModel?> login(LoginRequestModel model) async {
  const String url =
      "https://fypbackend.azurewebsites.net/Authentication/api/v1/Login";
  try {
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: loginRequestModelToJson(model),
    );
    print(response.body);
    var res = apiResponseFromJson(response.body);

    //var res = json.decode(response.body);

    if (res.status != "Successful") {
      throw (res);
    } else {
      LoginResponseModel loginResponseModel =
          LoginResponseModel.fromJson(res.data);
      storeToken(loginResponseModel.accessToken!);
      return loginResponseModel;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future<UserDto?> SignUp(SignUpRequestModel model) async {
  const String url =
      "https://fypbackend.azurewebsites.net/Authentication/api/v1/SignUp";

  try {
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: signUpRequestModelToJson(model),
    );

    print(response.body);
    var res = apiResponseFromJson(response.body);

    //var res = json.decode(response.body);

    if (res.status != "Successful") {
      throw (res);
    } else {
      UserDto userDto = UserDto.fromJson(res.data);
      return userDto;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future<bool> VerifyOtp(String code) async {
  String url =
      "https://fypbackend.azurewebsites.net/Authentication/api/v1/VerifyOtp?otpCode=$code";

  try {
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);
    var res = apiResponseFromJson(response.body);

    //var res = json.decode(response.body);

    if (res.status != "Successful") {
      throw (res);
    } else {
      return true;
    }
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> ResetPassword(ChangePasswordRequestModel model) async {
  String url =
      "https://fypbackend.azurewebsites.net/Authentication/api/v1/ResetPassword";

  try {
    var response = await http.post(Uri.parse(url),
        headers: headers, body: changePasswordRequestModelToJson(model));

    print(response.body);
    var res = apiResponseFromJson(response.body);
    if (res.status != "Successful") {
      throw (res);
    } else {
      return true;
    }
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> ForgotPassword(String email) async {
  String url =
      "https://fypbackend.azurewebsites.net/Authentication/api/v1/ForgotPassword?email=$email";

  try {
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    var res = apiResponseFromJson(response.body);

    //var res = json.decode(response.body);

    if (res.status != "Successful") {
      throw (res);
    } else {
      return true;
    }
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> uploadProfilePic(File imageFile) async {
  String? jwt = await getToken();
  Map<String, String> headers1 = {
    'Authorization': 'Bearer $jwt',
  };
  try {
    List<int> imageBytes = imageFile.readAsBytesSync();

    // Send the image to the server
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://fypbackend.azurewebsites.net/Authentication/api/v1/UploadPicture'));

    // Create a multipart form field and attach the image bytes
    var multipartFile = http.MultipartFile.fromBytes(
      'image',
      imageBytes,
      filename: basename(imageFile.path),
    );
    //add headers
    request.headers.addAll(headers1);
    // Add the multipart form field to the request
    request.files.add(multipartFile);

    // Send the request and get the response
    var resp = await request.send();
    var response = await http.Response.fromStream(resp);
    var res = apiResponseFromJson(response.body);

    //var res = json.decode(response.body);

    if (res.status != "Successful") {
      throw (res);
    } else {
      return true;
    }
  } catch (e) {
    print(e);
    return false;
  }
}


Future<bool> PerformKYC(String email, String type, String idNumber, File file) async {
 
 try{ var request = http.MultipartRequest('POST', Uri.parse('https://fypbackend.azurewebsites.net/Authentication/api/v1/PerformKyc'));

  request.fields['email'] = email;
  request.fields['DocType'] = type;
  request.fields['DocNumber'] = idNumber;


  var fileStream = http.ByteStream(file.openRead());
  var fileLength = await file.length();

  var multipartFile = http.MultipartFile(
    'Selfie',
    fileStream,
    fileLength,
    filename: file.path.split('/').last,
  );

 request.files.add(multipartFile);

  var resp = await request.send();
  var response = await http.Response.fromStream(resp);
  var res = apiResponseFromJson(response.body);

    //var res = json.decode(response.body);

    if (res.status != "Successful") {
      throw (res);
    } else {
      return true;
    }
  } catch (e) {
    print(e);
    return false;
  }
}

//method to store token received on Login
void storeToken(String token) async {
  const storage = FlutterSecureStorage();
  await storage.write(key: 'token', value: token);
  print('JSON web Token stored successfully');
}

//method to retrieve token received on Login
Future<String?> getToken() async {
  const storage = FlutterSecureStorage();
  String? jwt = await storage.read(key: 'token');
  print(jwt);
  return jwt;
}

void storeLatitude(String latitude) async {
  const storage = FlutterSecureStorage();
  await storage.write(key: 'latitude', value: latitude);
  
}

//method to retrieve token received on Login
Future<String?> getLatitude() async {
  const storage = FlutterSecureStorage();
  String? jwt = await storage.read(key: 'latitude');
  print(jwt);
  return jwt;
}

void storeLongitude(String longitude) async {
  const storage = FlutterSecureStorage();
  await storage.write(key: 'longitude', value: longitude);
  
}

//method to retrieve token received on Login
Future<String?> getLongitude() async {
  const storage = FlutterSecureStorage();
  String? jwt = await storage.read(key: 'longitude');
  print(jwt);
  return jwt;
}

void storeEmail(String email) async {
  const storage = FlutterSecureStorage();
  await storage.write(key: 'email', value: email);
  
}

//method to retrieve token received on Login
Future<String?> getEmail() async {
  const storage = FlutterSecureStorage();
  String? email = await storage.read(key: 'email');
  print(email);
  return email;
}
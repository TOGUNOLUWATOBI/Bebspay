import 'package:app/Model/Authentication/LoginRequestModel.dart';
import 'package:app/Model/RequestModel/ChangePasswordRequestModel.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
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

      //TODO: ask chizaram how to pass query parameter
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
      "https://fypbackend.azurewebsites.net/Authentication/api/v1/VerifyOtp?email=$email";

  try {
    var response = await http.post(
      Uri.parse(url),
      headers: headers,

      //TODO: ask chizaram how to pass query parameter
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

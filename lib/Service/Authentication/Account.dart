import 'package:app/Model/Account/TransactionDto.dart';
import 'package:app/Model/Account/TransferRequestModel.dart';
import 'package:app/Model/RequestModel/AddTransactionPinModel.dart';
import 'package:app/Model/RequestModel/BuyAirtimeRequestModel.dart';
import 'package:app/Model/RequestModel/ChangePanicPinModel.dart';
import 'package:app/Model/RequestModel/ChangeTransactionPinModel.dart';
import 'package:app/Model/RequestModel/CheckTransactionPinModel.dart';
import 'package:app/Service/Authentication/Authentication.dart';
import 'package:http/http.dart' as http;
import '../../Model/ApiResponse/ApiResponse.dart';
import '../../Model/RequestModel/AddPanicPinModel.dart';


Future<Map<String, String>> createHeader() async {
  // Get the JWT token
  String? token = await getToken();

  // Create the header
  Map<String, String> header = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };

  return header;
}


Future<bool?> AddPanicPin(AddPanicPinModel model) async {
  const String url =
      "https://fypbackend.azurewebsites.net/Account/api/v1/AddPanicMode";
  try {
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: addPanicPinModelToJson(model),
    );
    print(response.body);
    var res = apiResponseFromJson(response.body);

    if (res.status != "Successful") {
      throw (res);
    } else {
      return true;
    }
  } catch (e) {
    print(e);
    return null;
  }
}


Future<bool?> ChangePanicPin(ChangePanicPinModel model) async {
  const String url =
      "https://fypbackend.azurewebsites.net/Account/api/v1/ChangePanicModePin";
  try {
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: changePanicPinModelToJson(model),
    );
    print(response.body);
    var res = apiResponseFromJson(response.body);

    if (res.status != "Successful") {
      throw (res);
    } else {
      return true;
    }
  } catch (e) {
    print(e);
    return null;
  }
}



Future<bool?> ChangeTransactionPin(ChangeTransactionPinModel model) async {
  const String url =
      "https://fypbackend.azurewebsites.net/Account/api/v1/ChangeTransactionPin";
  try {
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: changeTransactionPinModelToJson(model),
    );
    print(response.body);
    var res = apiResponseFromJson(response.body);

    if (res.status != "Successful") {
      throw (res);
    } else {
      return true;
    }
  } catch (e) {
    print(e);
    return null;
  }
}


Future<bool?> AddTransactionPin(AddTransactionPinModel model) async {
  const String url =
      "https://fypbackend.azurewebsites.net/Account/api/v1/AddTransactionPin";
  try {
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: AddTransactionPinModelToJson(model),
    );
    print(response.body);
    var res = apiResponseFromJson(response.body);

    if (res.status != "Successful") {
      throw (res);
    } else {
      return true;
    }
  } catch (e) {
    print(e);
    return null;
  }
}


Future<bool?> CheckTransactionPanicPin(CheckTransactionPinModel model) async {
  const String url =
      "https://fypbackend.azurewebsites.net/Account/api/v1/CheckTransactionPanicPin";
  try {
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: checkTransactionPinModelToJson(model),
    );
    print(response.body);
    var res = apiResponseFromJson(response.body);

    if (res.status != "Successful") {
      throw (res);
    } else {
      return true;
    }
  } catch (e) {
    print(e);
    return null;
  }
}


Future<TransactionDto?> InitiateTransfer(TransferRequestModel model) async {
  const String url =
      "https://fypbackend.azurewebsites.net/Account/api/v1/InitiateTransfer";

  try {
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: transferRequestModelToJson(model),
    );

    print(response.body);
    var res = apiResponseFromJson(response.body);

    //var res = json.decode(response.body);

    if (res.status != "Successful") {
      throw (res);
    } else {
      TransactionDto transactionDto = transactionDtoFromJson(res.data);
      return transactionDto;
    }
  } catch (e) {
    print(e);
    return null;
  }
}


Future<TransactionDto?> BuyAirtimeData(BuyAirtimeRequestModel model) async {
  const String url =
      "https://fypbackend.azurewebsites.net/Account/api/v1/BuyAiritme";

  try {
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: buyAirtimeRequestModelToJson(model),
    );

    print(response.body);
    var res = apiResponseFromJson(response.body);

    //var res = json.decode(response.body);

    if (res.status != "Successful") {
      throw (res);
    } else {
      TransactionDto transactionDto = transactionDtoFromJson(res.data);
      return transactionDto;
    }
  } catch (e) {
    print(e);
    return null;
  }
}








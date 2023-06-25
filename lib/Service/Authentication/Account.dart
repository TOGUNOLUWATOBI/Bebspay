import 'dart:convert';

import 'package:app/Model/Account/TransactionDto.dart';
import 'package:app/Model/Account/TransferRequestModel.dart';
import 'package:app/Model/Account/VerifyAccountUserRequestModel.dart';
import 'package:app/Model/RequestModel/AddTransactionPinModel.dart';
import 'package:app/Model/RequestModel/BuyAirtimeRequestModel.dart';
import 'package:app/Model/RequestModel/ChangePanicPinModel.dart';
import 'package:app/Model/RequestModel/ChangeTransactionPinModel.dart';
import 'package:app/Model/RequestModel/CheckTransactionPinModel.dart';
import 'package:app/Service/Authentication/Authentication.dart';
import 'package:http/http.dart' as http;
import '../../Model/Account/AccountDetails.dart';
import '../../Model/Account/Banks.dart';
import '../../Model/Account/DashboardDetails.dart';
import '../../Model/Account/Databundle.dart';
import '../../Model/Account/FeeResponseModel.dart';
import '../../Model/Account/FundWalletDto.dart';
import '../../Model/Account/VerifyAccountUserResponseModel.dart';
import '../../Model/ApiResponse/ApiResponse.dart';
import '../../Model/RequestModel/AddPanicPinModel.dart';
import '../../Model/RequestModel/SaveFcmTokenRequestModel.dart';


Future<Map<String, String>> createHeader() async {
  // Get the JWT token
  String? token = await getToken();

  // Create the header
  Map<String, String> header = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${token!}',
  };

  return header;
}


Future<bool?> AddPanicPin(AddPanicPinModel model) async {
  const String url =
      "https://fypbackend.azurewebsites.net/Account/api/v1/AddPanicMode";
  try {
    var response = await http.post(
      Uri.parse(url),
      headers: await createHeader(),
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
      headers: await createHeader(),
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
      headers: await createHeader(),
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
      headers: await createHeader(),
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
      headers: await createHeader(),
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
      headers: await createHeader(),
      body: transferRequestModelToJson(model),
    );

    print(response.body);
    var res = apiResponseFromJson(response.body);

    //var res = json.decode(response.body);

    if (res.status != "Successful") {
      throw (res);
    } else {
      TransactionDto transactionDto = TransactionDto.fromJson(res.data);
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
      headers: await createHeader(),
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


Future<double?> GetFeeAmount (int amount) async
{
 String url =
      "https://fypbackend.azurewebsites.net/Account/api/v1/GetAmountFees?amount=$amount";
  try {
    var response = await http.get(
      Uri.parse(url),      
    );
    print(response.body);
    var res = apiResponseFromJson(response.body);

    if (res.status != "Successful") {
      throw (res);
    } else {
      var feeResponseModel = FeeResponseModel.fromJson(res.data);
      return feeResponseModel.data!.first.fee;      
    }
  } catch (e) {
    print(e);
    return null;
  }
}


Future<VerifyAccountUserResponseModel?> VerifyAccount (VerifyAccountUserRequestModel model) async
{
 String url =
      "https://fypbackend.azurewebsites.net/Account/api/v1/VerifyAccountDetails";
  try {
    var response = await http.post(
      Uri.parse(url),
      headers: await createHeader(),
      body: verifyAccountUserRequestModelToJson(model),      
    );
    print(response.body);
    var res = apiResponseFromJson(response.body);

    if (res.status != "Successful") {
      throw (res);
    } else {
      var verifyAccountResponseModel = VerifyAccountUserResponseModel.fromJson(res.data);
      return verifyAccountResponseModel;
    }
  } catch (e) {
    print(e);
    return null;
  }
}


Future<DashboardDetails?> GetDashboardDetails () async
{
 String url =
      "https://fypbackend.azurewebsites.net/Account/api/v1/dashboard";
  try {
    var response = await http.get(
      Uri.parse(url),
      headers: await createHeader(),
            
    );
    print(response.body);
    var res = apiResponseFromJson(response.body);

    if (res.status != "Successful") {
      throw (res);
    } else {
      var dashboardDetails = DashboardDetails.fromJson(res.data);
      return dashboardDetails;
    }
  } catch (e) {
    print(e);
    return null;
  }
}


Future<AccountDetails?> GetAccountDetails () async
{
 String url =
      "https://fypbackend.azurewebsites.net/Account/api/v1/UserAccountDetails";
  try {
    var response = await http.get(
      Uri.parse(url),
      headers: await createHeader(),
            
    );
    print(response.body);
    var res = apiResponseFromJson(response.body);

    if (res.status != "Successful") {
      throw (res);
    } else {
      var accountDetails = AccountDetails.fromJson(res.data);
      return accountDetails;
    }
  } catch (e) {
    print(e);
    return null;
  }
}


Future<FundWalletDto?> GetFundWalletDetails () async
{
 String url =
      "https://fypbackend.azurewebsites.net/Account/api/v1/FundWalletDetails";
  try {
    var response = await http.get(
      Uri.parse(url),
      headers: await createHeader(),
            
    );
    print(response.body);
    var res = apiResponseFromJson(response.body);

    if (res.status != "Successful") {
      throw (res);
    } else {
      var fundWalletDto = fundWalletDtoFromJson(res.data);
      return fundWalletDto;
    }
  } catch (e) {
    print(e);
    return null;
  }
}


Future<List<Bank>?> GetBanks () async
{
 String url =
      "https://fypbackend.azurewebsites.net/Account/api/v1/banks";
  try {
    var response = await http.get(
      Uri.parse(url),
      headers: await createHeader(),
            
    );
    print(response.body);
    var res = apiResponseFromJson(response.body);

    if (res.status != "Successful") {
      throw (res);
    } else {
      var banks = List<Bank>.from(res.data.map((x) => Bank.fromJson(x))).toList();
      print(banks);
      return banks ;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future<List<DataBundle>?> GetDataBundle(String serviceProvider) async
{
 String url =
      "https://fypbackend.azurewebsites.net/Account/api/v1/GetDataBundles?serviceProvier=$serviceProvider";
  try {
    var response = await http.get(
      Uri.parse(url),
      headers: await createHeader(),
            
    );
    print(response.body);
    var res = apiResponseFromJson(response.body);

    if (res.status != "Successful") {
      throw (res);
    } else {
      var banks = List<DataBundle>.from(res.data['data'].map((x) => DataBundle.fromJson(x))).toList();
      print(banks);
      return banks ;
    }
  } catch (e) {
    print(e);
    return null;
  }
}


Future<List<TransactionDto>?> GetTransactions (int count) async
{
 String url =
      "https://fypbackend.azurewebsites.net/Account/api/v1/transactions?count=$count";
  try {
    var response = await http.get(
      Uri.parse(url),
      headers: await createHeader(),
            
    );
    print(response.body);
    var res = apiResponseFromJson(response.body);

    if (res.status != "Successful") {
      throw (res);
    } else {
      var transactions = List<TransactionDto>.from(res.data.map((x) => TransactionDto.fromJson(x)));
      return transactions;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

// Future<List<BillCategories>?> GetDataBundle (String serviceProvider) async
// {
//  String url =
//       "https://fypbackend.azurewebsites.net/Account/api/v1/GetDataBundles?serviceProvier=$serviceProvider";
//   try {
//     var response = await http.get(
//       Uri.parse(url),
//       headers: await createHeader(),
            
//     );
//     print(response.body);
//     var res = apiResponseFromJson(response.body);

//     if (res.status != "Successful") {
//       throw (res);
//     } else {
//       var dataBundles = List<BillCategories>.from(res.data.map((x) => BillCategories.fromJson(x)));
//       return dataBundles ;
//     }
//   } catch (e) {
//     print(e);
//     return null;
//   }
// }



Future<bool?> SaveFcmToken (SaveFcmTokenModel model) async
{
 String url =
      "https://fypbackend.azurewebsites.net/Authentication/api/v1/SaveFcmToken";
  try {
    var response = await http.post(
      Uri.parse(url),
      headers: await createHeader(),
      body: SaveFcmTokenModelToJson(model),      
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
    return false;
  }
}


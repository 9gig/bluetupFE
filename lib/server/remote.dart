import 'dart:convert';

import 'package:bluetup_inc/config/api_config.dart';
import 'package:bluetup_inc/models/active-matured.dart';
import 'package:bluetup_inc/models/createRef.dart';
import 'package:bluetup_inc/models/deals.dart';
import 'package:bluetup_inc/models/get-wallet-balance.dart';
import 'package:bluetup_inc/models/getOtp.dart';
import 'package:bluetup_inc/models/getSave.dart';
import 'package:bluetup_inc/models/login_res.dart';
import 'package:bluetup_inc/models/register.dart';
import 'package:bluetup_inc/models/signed.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../models/general.dart';
import '../models/getinvBal.dart';
import '../models/newInv.dart';
import '../models/ref_details.dart';

class RemoteService {
  static var client = http.Client();

  // Service to get otp
  static Future getCode(GetOtp model) async {
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*"
    };

    var url = Uri.https(ApiConfig.hostName, ApiConfig.getOtp);
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  // Service code to verify otp
  static Future<bool> checkCode(String phone, code) async {
    Map<String, String> requestHeaders = {"Content-Type": "application/json"};

    var url = Uri.https(ApiConfig.hostName, ApiConfig.checkOtp + phone + code);
    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      print(response.body);
      return true;
    } else {
      print(response.body);
      return false;
    }
  }

  //Service code to Sign the USer Up
  static Future<SignedUp> register(RegisterModel model) async {
    Map<String, String> requestHeaders = {"Content-Type": "application/json"};

    var url = Uri.https(ApiConfig.hostName, ApiConfig.signUp);
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));

    if (response.statusCode == 200) {
    var jit =  signedUpFromJson(response.body);

      return jit;
    } else {
      var jit =  signedUpFromJson(response.body);
      return jit;
    }
  }

  //Login Service
  static Future<bool> logIn(model) async {
    var userData = GetStorage();
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*"
    };

    var url = Uri.https(ApiConfig.hostName, ApiConfig.login);
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));

    if (response.statusCode == 200) {
      await userData.write('User', jsonEncode(response.body));
      var u = loginResponseFromJson(jsonDecode(userData.read('User')));
      await GetStorage().write('Token', u.data.token);
      print(u.data.firstName);

      return true;
    } else {
      return false;
    }
  }

  //Getting wallet balance
  //get gen balance
  static Future<GetBalance> genBal() async {
    var userData = GetStorage();
    var u = loginResponseFromJson(jsonDecode(userData.read('User')));
    var userId = u.data.uId;
    var token = userData.read('Token');
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Authorization": "Basic $token"
    };
    var url =
        Uri.https(ApiConfig.hostName, ApiConfig.getWalletBalance + userId);
    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      return getBalanceFromJson(response.body);
    } else {
      return getBalanceFromJson(response.body);
    }
  }

  //get inv balance
  static Future<GetInvBalance> invBal() async {
    var userData = GetStorage();
    var u = loginResponseFromJson(jsonDecode(userData.read('User')));
    var userId = u.data.uId;
    var token = userData.read('Token');
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Authorization": "Basic $token"
    };
    var url = Uri.https(ApiConfig.hostName, ApiConfig.getinvBalance + userId);
    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      print(response.body);
      return getInvBalanceFromJson(response.body);
    } else {
      return getInvBalanceFromJson(response.body);
    }
  }
  //get savings balance
  //get savings balance
  //get savings balance
  //get savings balance

  //Get inv deals
  static Future<Dealer> dealer() async {
    var userData = GetStorage();
    var u = loginResponseFromJson(jsonDecode(userData.read('User')));
    var userId = u.data.uId;
    var token = userData.read('Token');
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Authorization": "Basic $token"
    };
    var url = Uri.https(ApiConfig.hostName, ApiConfig.getDeals);
    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      return dealerFromJson(response.body);
      ;
    } else {
      return dealerFromJson(response.body);
      ;
    }
  }

  static Future<ActiveAndMatured> getInvz() async {
    var userData = GetStorage();
    var u = loginResponseFromJson(jsonDecode(userData.read('User')));
    var userId = u.data.uId;
    var token = userData.read('Token');
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Authorization": "Basic $token"
    };
    var url = Uri.https(ApiConfig.hostName, ApiConfig.getInvz + userId);
    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      return activeAndMaturedFromJson(response.body);
    } else {
      return activeAndMaturedFromJson(response.body);
    }
  }

  // Purchasing or adding to an an investment
  static Future<InvestRezy> purchaseInv(model) async {
    var userData = GetStorage();
    var u = loginResponseFromJson(jsonDecode(userData.read('User')));
    var userId = u.data.uId;
    var token = userData.read('Token');
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Authorization": "Basic $token"
    };
    var url = Uri.https(ApiConfig.hostName, ApiConfig.addNewInv);
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));

    if (response.statusCode == 200) {
      return investRezyFromJson(response.body);
    } else {
      return investRezyFromJson(response.body);
    }
  }

  static Future<GetSavings> getSavings() async {
    var userData = GetStorage();
    var u = loginResponseFromJson(jsonDecode(userData.read('User')));
    var userId = u.data.uId;
    var token = userData.read('Token');
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Authorization": "Basic $token"
    };
    var url = Uri.https(ApiConfig.hostName, ApiConfig.getSavings + userId);
    var response = await client.get(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      print(response.body);
      return getSavingsFromJson(response.body);
    } else {
      return getSavingsFromJson(response.body);
    }
  }


  static Future<CreateRef> createRef(modded)async{
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*",
    };

    var url = Uri.https(ApiConfig.hostName, ApiConfig.createRef);
    var response = await client.post(url, headers: requestHeaders, body: jsonEncode(modded));
    if (response.statusCode == 200) {
      // print(response.body);
      return createRefFromJson(response.body);
    } else {
      return createRefFromJson(response.body);
    }

  }
  static Future<CreateRef> addRef(refData)async{
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*",
    };

    var url = Uri.https(ApiConfig.hostName, ApiConfig.addRef);
    var response = await client.post(url, headers: requestHeaders, body: jsonEncode(refData));
    if (response.statusCode == 200) {
      // print(response.body);
      return createRefFromJson(response.body);
    } else {
      return createRefFromJson(response.body);
    }

  }



  static Future<RefDetails> getRefDetails() async {
    var userData = GetStorage();
    var u = loginResponseFromJson(jsonDecode(userData.read('User')));
    var userId = u.data.uId;
    var token = userData.read('Token');
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Authorization": "Basic $token"
    };
    var url = Uri.https(ApiConfig.hostName, ApiConfig.getRef + userId);
    var response = await client.get(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      print(response.body);
      return refDetailsFromJson(response.body);
    } else {
      return refDetailsFromJson(response.body);
    }
  }

  //Adding to General wallet

static Future<String> addGen(modi)async{
      var userData = GetStorage();
      var u = loginResponseFromJson(jsonDecode(userData.read('User')));
      var userId = u.data.uId;
      var token = userData.read('Token');
      Map<String, String> requestHeaders = {
        "Content-Type": "application/json",
        "Access-Control-Allow-Origin": "*",
        "Authorization": "Basic $token"
      };

      var url = Uri.https(ApiConfig.hostName, ApiConfig.addWalletBalance);
      var response = await client.post(url, headers: requestHeaders, body: jsonEncode(modi.toJson()));
          if (response.statusCode == 200) {
        var msg = replyGeneralFromJson(response.body);
        return msg.message;
      } else {
            var msg = replyGeneralFromJson(response.body);
            return msg.message;
      }
    }
}

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config/api_config.dart';

class ExternalService {
  static var client = http.Client();

  static Future getRates() async {
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*"
    };

    var url = Uri.parse(ApiConfig.rate);
    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      print(response.body);
      return true;
    } else {
      return false;
    }
  }
}

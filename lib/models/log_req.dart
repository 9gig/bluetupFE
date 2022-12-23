// To parse this JSON data, do
//
//     final loginReq = loginReqFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginReq loginReqFromJson(String str) => LoginReq.fromJson(json.decode(str));

String loginReqToJson(LoginReq data) => json.encode(data.toJson());

class LoginReq {
  LoginReq({
    required this.phone,
    required this.password,
  });

  String phone;
  String password;

  factory LoginReq.fromJson(Map<String, dynamic> json) => LoginReq(
        phone: json["phone"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "password": password,
      };
}

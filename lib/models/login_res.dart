// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'package:bluetup_inc/controllers/home-ctrl.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.phone,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.uId,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.token,
  });

  String phone;
  String firstName;
  String lastName;
  String email;
  String uId;
  DateTime createdAt;
  DateTime updatedAt;
  String id;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        phone: json["phone"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        uId: json["uID"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "uID": uId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id": id,
        "token": token,
      };
}

class Wallet {
  Wallet({
    required this.type,
    required this.bal,
  });

  String type;
  var bal;
}

final HomeCtrl homeCtrl = Get.put(HomeCtrl());
List<Wallet> wallie = [
  Wallet(
      type: 'General',
      bal: homeCtrl.genBal.value == '' ? '0.00' : homeCtrl.genBal),
  Wallet(
      type: 'Savings',
      bal: homeCtrl.saveBal.value == '' ? '0.00' : homeCtrl.saveBal),
  Wallet(
      type: 'Investments',
      bal: homeCtrl.invBal.value == '' ? '0.00' : homeCtrl.invBal),
];

// To parse this JSON data, do
//
//     final getBalance = getBalanceFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetBalance getBalanceFromJson(String str) =>
    GetBalance.fromJson(json.decode(str));

String getBalanceToJson(GetBalance data) => json.encode(data.toJson());

class GetBalance {
  GetBalance({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory GetBalance.fromJson(Map<String, dynamic> json) => GetBalance(
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
    required this.title,
    required this.bal,
  });

  String title;
  String bal;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        title: json["title"],
        bal: json["bal"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "bal": bal,
      };
}

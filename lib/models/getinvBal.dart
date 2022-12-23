// To parse this JSON data, do
//
//     final getInvBalance = getInvBalanceFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetInvBalance getInvBalanceFromJson(String str) =>
    GetInvBalance.fromJson(json.decode(str));

String getInvBalanceToJson(GetInvBalance data) => json.encode(data.toJson());

class GetInvBalance {
  GetInvBalance({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory GetInvBalance.fromJson(Map<String, dynamic> json) => GetInvBalance(
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
    required this.profit,
  });

  String title;
  String bal;
  String profit;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        title: json["title"],
        bal: json["bal"],
        profit: json["profit"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "bal": bal,
        "profit": profit,
      };
}

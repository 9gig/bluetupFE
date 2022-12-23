// To parse this JSON data, do
//
//     final getSavings = getSavingsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetSavings getSavingsFromJson(String str) =>
    GetSavings.fromJson(json.decode(str));

String getSavingsToJson(GetSavings data) => json.encode(data.toJson());

class GetSavings {
  GetSavings({
    required this.message,
    required this.result,
  });

  String message;
  Result result;

  factory GetSavings.fromJson(Map<String, dynamic> json) => GetSavings(
        message: json["message"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "result": result.toJson(),
      };
}

class Result {
  Result({
    required this.tB,
    required this.tW,
    required this.tR,
    required this.details,
  });

  int tB;
  int tW;
  int tR;
  List<Detail> details;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        tB: json["tB"],
        tW: json["tW"],
        tR: json["tR"],
        details:
            List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tB": tB,
        "tW": tW,
        "tR": tR,
        "details": List<dynamic>.from(details.map((x) => x.toJson())),
      };
}

class Detail {
  Detail({
    required this.id,
    required this.userId,
    required this.balance,
    required this.withdrawable,
    required this.payDay,
    required this.intrest,
    required this.transactions,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String userId;
  String balance;
  String withdrawable;
  String payDay;
  String intrest;
  List<dynamic> transactions;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        id: json["_id"],
        userId: json["userId"],
        balance: json["balance"],
        withdrawable: json["withdrawable"],
        payDay: json["payDay"],
        intrest: json["intrest"],
        transactions: List<dynamic>.from(json["transactions"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "balance": balance,
        "withdrawable": withdrawable,
        "payDay": payDay,
        "intrest": intrest,
        "transactions": List<dynamic>.from(transactions.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

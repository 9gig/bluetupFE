// To parse this JSON data, do
//
//     final invest = investFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';


Invest investFromJson(String str) => Invest.fromJson(json.decode(str));

String investToJson(Invest data) => json.encode(data.toJson());

class Invest {
  Invest({
    required this.userId,
    required this.invDetails,
    required this.capital,
    required this.bal,
    required this.units,
    required this.dur,
    required this.returns,
    required this.interval,
    required this.paymentMethod,
  });

  String userId;
  String invDetails;
  String capital;
  String bal;
  String units;
  String dur;
  String returns;
  String interval;
  String paymentMethod;

  factory Invest.fromJson(Map<String, dynamic> json) => Invest(
    userId: json["userId"],
    invDetails: json["invDetails"],
    capital: json["capital"],
    bal: json["bal"],
    units: json["units"],
    dur: json["dur"],
    returns: json["returns"],
    interval: json["interval"],
    paymentMethod: json["paymentMethod"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "invDetails": invDetails,
    "capital": capital,
    "bal": bal,
    "units": units,
    "dur": dur,
    "returns": returns,
    "interval": interval,
    "paymentMethod": paymentMethod,
  };
}


// To parse this JSON data, do
//
//     final investRezy = investRezyFromJson(jsonString);


InvestRezy investRezyFromJson(String str) => InvestRezy.fromJson(json.decode(str));

String investRezyToJson(InvestRezy data) => json.encode(data.toJson());

class InvestRezy {
  InvestRezy({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory InvestRezy.fromJson(Map<String, dynamic> json) => InvestRezy(
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
    required this.userId,
    required this.invDetails,
    required this.capital,
    required this.bal,
    required this.profit,
    required this.unitsHeld,
    required this.dInt,
    required this.durationMonths,
    required this.uppieDated,
    required this.interval,
    required this.startDate,
    required this.endDate,
    required this.nextWithdrawal,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String userId;
  String invDetails;
  String capital;
  String bal;
  String profit;
  String unitsHeld;
  String dInt;
  String durationMonths;
  String uppieDated;
  String interval;
  String startDate;
  String endDate;
  List<DateTime> nextWithdrawal;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["userId"],
    invDetails: json["invDetails"],
    capital: json["capital"],
    bal: json["bal"],
    profit: json["profit"],
    unitsHeld: json["unitsHeld"],
    dInt: json["dInt"],
    durationMonths: json["durationMonths"],
    uppieDated: json["uppieDated"],
    interval: json["interval"],
    startDate: json["startDate"],
    endDate: json["endDate"],
    nextWithdrawal: List<DateTime>.from(json["nextWithdrawal"].map((x) => DateTime.parse(x))),
    id: json["_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "invDetails": invDetails,
    "capital": capital,
    "bal": bal,
    "profit": profit,
    "unitsHeld": unitsHeld,
    "dInt": dInt,
    "durationMonths": durationMonths,
    "uppieDated": uppieDated,
    "interval": interval,
    "startDate": startDate,
    "endDate": endDate,
    "nextWithdrawal": List<dynamic>.from(nextWithdrawal.map((x) => x.toIso8601String())),
    "_id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}


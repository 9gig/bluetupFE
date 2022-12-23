// To parse this JSON data, do
//
//     final activeAndMatured = activeAndMaturedFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ActiveAndMatured activeAndMaturedFromJson(String str) =>
    ActiveAndMatured.fromJson(json.decode(str));

String activeAndMaturedToJson(ActiveAndMatured data) =>
    json.encode(data.toJson());

class ActiveAndMatured {
  ActiveAndMatured({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory ActiveAndMatured.fromJson(Map<String, dynamic> json) =>
      ActiveAndMatured(
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
    required this.active,
    required this.matured,
  });

  List<Active> active;
  List<Matured> matured;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        active:
            List<Active>.from(json["active"].map((x) => Active.fromJson(x))),
        matured:
            List<Matured>.from(json["matured"].map((x) => Matured.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "active": List<dynamic>.from(active.map((x) => x.toJson())),
        "matured": List<dynamic>.from(matured.map((x) => x.toJson())),
      };
}

class Active {
  Active({
    required this.id,
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
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String userId;
  InvDetails invDetails;
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
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Active.fromJson(Map<String, dynamic> json) => Active(
        id: json["_id"],
        userId: json["userId"],
        invDetails: InvDetails.fromJson(json["invDetails"]),
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
        nextWithdrawal: List<DateTime>.from(
            json["nextWithdrawal"].map((x) => DateTime.parse(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "invDetails": invDetails.toJson(),
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
        "nextWithdrawal":
            List<dynamic>.from(nextWithdrawal.map((x) => x.toIso8601String())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class Matured {
  Matured({
    required this.id,
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
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String userId;
  InvDetails invDetails;
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
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Matured.fromJson(Map<String, dynamic> json) => Matured(
        id: json["_id"],
        userId: json["userId"],
        invDetails: InvDetails.fromJson(json["invDetails"]),
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
        nextWithdrawal: List<DateTime>.from(
            json["nextWithdrawal"].map((x) => DateTime.parse(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "invDetails": invDetails.toJson(),
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
        "nextWithdrawal":
            List<dynamic>.from(nextWithdrawal.map((x) => x.toIso8601String())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class InvDetails {
  InvDetails({
    required this.id,
    required this.name,
    required this.totalUnit,
    required this.cost,
    required this.returns,
    required this.invType,
    required this.duration,
    required this.invSector,
    required this.location,
    required this.insurancePatner,
    required this.payoutType,
    required this.unitType,
    required this.assets,
    required this.cloudinaryId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String name;
  String totalUnit;
  String cost;
  String returns;
  String invType;
  String duration;
  String invSector;
  String location;
  String insurancePatner;
  String payoutType;
  String unitType;
  List<String> assets;
  List<String> cloudinaryId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory InvDetails.fromJson(Map<String, dynamic> json) => InvDetails(
        id: json["_id"],
        name: json["name"],
        totalUnit: json["totalUnit"],
        cost: json["cost"],
        returns: json["returns"],
        invType: json["invType"],
        duration: json["duration"],
        invSector: json["invSector"],
        location: json["location"],
        insurancePatner: json["insurancePatner"],
        payoutType: json["payoutType"],
        unitType: json["unitType"],
        assets: List<String>.from(json["assets"].map((x) => x)),
        cloudinaryId: List<String>.from(json["cloudinary_id"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "totalUnit": totalUnit,
        "cost": cost,
        "returns": returns,
        "invType": invType,
        "duration": duration,
        "invSector": invSector,
        "location": location,
        "insurancePatner": insurancePatner,
        "payoutType": payoutType,
        "unitType": unitType,
        "assets": List<dynamic>.from(assets.map((x) => x)),
        "cloudinary_id": List<dynamic>.from(cloudinaryId.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

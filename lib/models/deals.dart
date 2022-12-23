// To parse this JSON data, do
//
//     final getDeals = getDealsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<GetDeals> getDealsFromJson(String str) =>
    List<GetDeals>.from(json.decode(str).map((x) => GetDeals.fromJson(x)));

String getDealsToJson(List<GetDeals> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetDeals {
  GetDeals({
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

  factory GetDeals.fromJson(Map<String, dynamic> json) => GetDeals(
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

Dealer dealerFromJson(String str) => Dealer.fromJson(json.decode(str));

String dealerToJson(Dealer data) => json.encode(data.toJson());

class Dealer {
  Dealer({
    required this.message,
    required this.data,
  });

  String message;
  List<GetDeals> data;

  factory Dealer.fromJson(Map<String, dynamic> json) => Dealer(
        message: json["message"],
        data:
            List<GetDeals>.from(json["data"].map((x) => GetDeals.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

// class Datum {
//     Datum({
//         required this.id,
//         required this.name,
//         required this.totalUnit,
//         required this.cost,
//         required this.returns,
//         required this.invType,
//         required this.duration,
//         required this.invSector,
//         required this.location,
//         required this.insurancePatner,
//         required this.payoutType,
//         required this.unitType,
//         required this.assets,
//         required this.cloudinaryId,
//         required this.createdAt,
//         required this.updatedAt,
//         required this.v,
//     });

//     String id;
//     String name;
//     String totalUnit;
//     String cost;
//     String returns;
//     String invType;
//     String duration;
//     String invSector;
//     String location;
//     String insurancePatner;
//     String payoutType;
//     String unitType;
//     List<String> assets;
//     List<String> cloudinaryId;
//     DateTime createdAt;
//     DateTime updatedAt;
//     int v;

//     factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["_id"],
//         name: json["name"],
//         totalUnit: json["totalUnit"],
//         cost: json["cost"],
//         returns: json["returns"],
//         invType: json["invType"],
//         duration: json["duration"],
//         invSector: json["invSector"],
//         location: json["location"],
//         insurancePatner: json["insurancePatner"],
//         payoutType: json["payoutType"],
//         unitType: json["unitType"],
//         assets: List<String>.from(json["assets"].map((x) => x)),
//         cloudinaryId: List<String>.from(json["cloudinary_id"].map((x) => x)),
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "name": name,
//         "totalUnit": totalUnit,
//         "cost": cost,
//         "returns": returns,
//         "invType": invType,
//         "duration": duration,
//         "invSector": invSector,
//         "location": location,
//         "insurancePatner": insurancePatner,
//         "payoutType": payoutType,
//         "unitType": unitType,
//         "assets": List<dynamic>.from(assets.map((x) => x)),
//         "cloudinary_id": List<dynamic>.from(cloudinaryId.map((x) => x)),
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "__v": v,
//     };
// }


// To parse this JSON data, do
//
//     final refDetails = refDetailsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RefDetails refDetailsFromJson(String str) => RefDetails.fromJson(json.decode(str));

String refDetailsToJson(RefDetails data) => json.encode(data.toJson());

class RefDetails {
  RefDetails({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory RefDetails.fromJson(Map<String, dynamic> json) => RefDetails(
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
    required this.id,
    required this.uId,
    required this.refLink,
    required this.code,
    required this.referrals,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String uId;
  String refLink;
  String code;
  List<String> referrals;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    uId: json["uID"],
    refLink: json["ref_link"],
    code: json["code"],
    referrals: List<String>.from(json["referrals"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "uID": uId,
    "ref_link": refLink,
    "code": code,
    "referrals": List<dynamic>.from(referrals.map((x) => x)),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
Referrals referralsFromJson(String str) => Referrals.fromJson(json.decode(str));

String referralsToJson(Referrals data) => json.encode(data.toJson());

class Referrals {
  Referrals({
    required this.referrals,
  });

  List<dynamic> referrals;

  factory Referrals.fromJson(Map<String, dynamic> json) => Referrals(
    referrals: List<dynamic>.from(json["referrals"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "referrals": List<dynamic>.from(referrals.map((x) => x)),
  };
}

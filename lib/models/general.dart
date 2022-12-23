// To parse this JSON data, do
//
//     final toGeneral = toGeneralFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ToGeneral toGeneralFromJson(String str) => ToGeneral.fromJson(json.decode(str));

String toGeneralToJson(ToGeneral data) => json.encode(data.toJson());

class ToGeneral {
  ToGeneral({
    required this.bal,
    required this.userId,
  });

  String bal;
  String userId;

  factory ToGeneral.fromJson(Map<String, dynamic> json) => ToGeneral(
    bal: json["bal"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "bal": bal,
    "userId": userId,
  };
}


ReplyGeneral replyGeneralFromJson(String str) => ReplyGeneral.fromJson(json.decode(str));

String replyGeneralToJson(ReplyGeneral data) => json.encode(data.toJson());

class ReplyGeneral {
  ReplyGeneral({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory ReplyGeneral.fromJson(Map<String, dynamic> json) => ReplyGeneral(
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
    required this.userId,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String title;
  String bal;
  String userId;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    title: json["title"],
    bal: json["bal"],
    userId: json["userId"],
    id: json["_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "bal": bal,
    "userId": userId,
    "_id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}


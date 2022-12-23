// To parse this JSON data, do
//
//     final createRef = createRefFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CreateRef createRefFromJson(String str) => CreateRef.fromJson(json.decode(str));

String createRefToJson(CreateRef data) => json.encode(data.toJson());

class CreateRef {
  CreateRef({
    required this.message,
    required this.data,
  });

  String message;
  bool data;

  factory CreateRef.fromJson(Map<String, dynamic> json) => CreateRef(
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data,
  };
}


// To parse this JSON data, do
//
//     final createRefRr = createRefRrFromJson(jsonString);



CreateRefRr createRefRrFromJson(String str) => CreateRefRr.fromJson(json.decode(str));

String createRefRrToJson(CreateRefRr data) => json.encode(data.toJson());

class CreateRefRr {
  CreateRefRr({
    required this.userId,
    required this.link,
    required this.code,
  });

  String userId;
  String link;
  String code;

  factory CreateRefRr.fromJson(Map<String, dynamic> json) => CreateRefRr(
    userId: json["userId"],
    link: json["link"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "link": link,
    "code": code,
  };
}

// To parse this JSON data, do
//
//     final signedUp = signedUpFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SignedUp signedUpFromJson(String str) => SignedUp.fromJson(json.decode(str));

String signedUpToJson(SignedUp data) => json.encode(data.toJson());

class SignedUp {
    SignedUp({
        required this.message,
        required this.data,
    });

    String message;
    Data data;

    factory SignedUp.fromJson(Map<String, dynamic> json) => SignedUp(
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
    });

    String phone;
    String firstName;
    String lastName;
    String email;
    String uId;
    DateTime createdAt;
    DateTime updatedAt;
    String id;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        phone: json["phone"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        uId: json["uID"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
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
    };
}

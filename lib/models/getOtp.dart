// To parse this JSON data, do
//
//     final getOtp = getOtpFromJson(jsonString);

import 'dart:convert';

GetOtp getOtpFromJson(String str) => GetOtp.fromJson(json.decode(str));

String getOtpToJson(GetOtp data) => json.encode(data.toJson());

class GetOtp {
  GetOtp({
    required this.phone,
  });

  String phone;

  factory GetOtp.fromJson(Map<String, dynamic> json) => GetOtp(
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
      };
}

// This is to check and verify the otp code
CheckOtp checkOtpFromJson(String str) => CheckOtp.fromJson(json.decode(str));

String checkOtpToJson(CheckOtp data) => json.encode(data.toJson());

class CheckOtp {
  CheckOtp({
    required this.phone,
    required this.code,
  });

  String phone;
  String code;

  factory CheckOtp.fromJson(Map<String, dynamic> json) => CheckOtp(
        phone: json["phone"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "code": code,
      };
}

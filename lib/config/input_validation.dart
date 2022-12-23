import 'package:get/get.dart';

mixin InputValidationMixin {
  bool isPhoneValid(phone) => phone.length == 10;
  bool isEmailValid(email) => GetUtils.isEmail(email);
  RegExp regex = RegExp(r'^.{6,}$');
  bool isPasswordValid(password) => regex.hasMatch(password);
}

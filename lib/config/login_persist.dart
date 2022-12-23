import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLoginPref {
  static SharedPreferences? _prefs;
  static const _keyPhoneNumber = 'PhoneNumber';
  static const _keyUserPass = 'Password';
  static const _printChoice = 'Print';
  static Future initUser() async =>
      _prefs = await SharedPreferences.getInstance();

  static Future setPhoneNumber(String number) async =>
      await _prefs?.setString(_keyPhoneNumber, number);

  static Future setPassword(String pass) async =>
      await _prefs?.setString(_keyUserPass, pass);

  static Future getPhoneNumber() async =>
      await _prefs?.getString(_keyPhoneNumber);
  static Future getPassword() async => await _prefs?.getString(_keyUserPass);

  //Turn finger print on and off

  static Future turnOnPrint(bool choice) async {
    if (choice) {
      await _prefs?.setInt(_printChoice, 1);
    } else {
      await _prefs?.setInt(_printChoice, 0);
    }
  }

  //check if print is allowed
  static Future checkPrint() async => await _prefs?.getInt(_printChoice);
}

class LocalAuthy {
  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      return false;
    }
  }

  static Future<List<BiometricType>> getBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      return <BiometricType>[];
    }
  }

  static Future<bool> authenticate() async {
    final isAvailable = await hasBiometrics();
    if (!isAvailable) return false;

    try {
      return await _auth.authenticate(
          localizedReason: 'Scan Fingerprint to Authenticate',
          options:
              AuthenticationOptions(useErrorDialogs: true, stickyAuth: true));
    } on PlatformException catch (e) {
      // print(e);
      return false;
    }
  }
}

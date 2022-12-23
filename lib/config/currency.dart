import 'package:shared_preferences/shared_preferences.dart';

class CurrencyPrefrence {
  final String amount;
  final int rate;

  CurrencyPrefrence(this.amount, this.rate);

//Check user Prefrence
//
  // static checkCurrencyPrefrence() async {
  //   getCurrencyPrefrence().then((value) {});
  // }

//Getting currency Preference
  static Future getCurrencyPrefrence() async {
    final prefs = await SharedPreferences.getInstance();
    var prf = prefs.get('IsUSD');
    if (prf == null || prf == false) {
      prefs.setBool('IsUSD', false);
      return false;
    }
    if (prf == true) {
      return true;
    }
  }

//Stting Currency preference
  static setCurrencyPrefrence(String prf) async {
    final prefs = await SharedPreferences.getInstance();

    if (prf == 'usd') {
      prefs.setBool('IsUSD', true);
    }
    if (prf == 'ngn') {
      prefs.setBool('IsUSD', false);
    }
  }
}

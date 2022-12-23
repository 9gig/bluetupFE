import 'package:shared_preferences/shared_preferences.dart';

class UserCard {
  static SharedPreferences? _prefs;
  static const _cardDetails = 'Cards';

  static Future initUser() async =>
      _prefs = await SharedPreferences.getInstance();

  static Future setCard(List<String> cards) async =>
      await _prefs?.setStringList(_cardDetails, cards);

  static Future getCards() async => await _prefs?.getString(_cardDetails);
}

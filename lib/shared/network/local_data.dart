import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static late SharedPreferences _prefs;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future setValue(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  static int? getValue(String key) => _prefs.getInt(key);
}

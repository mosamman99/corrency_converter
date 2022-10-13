import 'package:shared_preferences/shared_preferences.dart';


class CashHelper{
  static late SharedPreferences prefs;

  // Retrieve string data stored
  static Future<String> getSavedString(String value,String defaultVal) async {
    prefs = await SharedPreferences.getInstance();
    String savedValue = prefs.getString(value) ?? defaultVal;
    return savedValue;
  }

// Store String data
  static Future<bool> setSavedString(String key,String value) async {
    prefs = await SharedPreferences.getInstance();
    bool savedValue =await prefs.setString(key,value);
    return savedValue;
  }

}
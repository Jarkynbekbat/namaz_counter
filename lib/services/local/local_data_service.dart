import 'package:shared_preferences/shared_preferences.dart';

// dateFrom
// dateTo

// bagymdatCount
// beshimCount
// asrCount
// shamCount
// kuptanCount

// firstSum

class LocalDataService {
  static Future<bool> setData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  static Future<String> getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getString(key);
    return value;
  }

  static Future<bool> deleteData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}

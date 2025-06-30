import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  const SharedPrefsService();

  Future<void> setValue(String key, dynamic data) async {
    if (data is List<String>) {
      await setStringList(key, data);
    }
  }

  Future<T?> fetchValue<T>(String key) async {
    if (T is List<String>) {
      return getStringList(key) as T;
    }

    return null;
  }

  Future<void> setStringList(String key, List<String> value) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setStringList(key, value);
  }

  Future<List<String>?> getStringList(String key) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    return sharedPreferences.getStringList(key);
  }
}

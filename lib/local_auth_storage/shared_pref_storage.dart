import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceStorage {
  factory SharedPreferenceStorage() => _instance;
  SharedPreferenceStorage._internal();
  static final SharedPreferenceStorage _instance =
      SharedPreferenceStorage._internal();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> write({required String key, required String value}) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString(key, value);
  }

  Future<String?> read({required String key}) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key);
  }

  Future<void> delete({required String key}) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.remove(key);
  }

  Future<void> deleteAll() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.clear();
  }
}

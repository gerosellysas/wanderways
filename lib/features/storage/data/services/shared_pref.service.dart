import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static final SharedPrefService instance = SharedPrefService._();
  factory SharedPrefService() => instance;
  static SharedPreferences? _sharedPref;

  SharedPrefService._();

  Future<SharedPreferences> get sharedPref async {
    if (_sharedPref != null) return _sharedPref!;
    _sharedPref = await SharedPreferences.getInstance();
    return _sharedPref!;
  }

  Future<void> reload() async {
    SharedPreferences? prefs = await sharedPref;
    await prefs.reload();
  }

  Future<bool> writeInt(String key, int value) async {
    SharedPreferences? prefs = await sharedPref;
    return await prefs.setInt(key, value);
  }

  Future<int?> readInt(String key, int defaultValue) async {
    SharedPreferences? prefs = await sharedPref;
    return prefs.getInt(key) ?? defaultValue;
  }

  Future<bool> delete(String key) async {
    SharedPreferences? prefs = await sharedPref;
    return await prefs.remove(key);
  }
}

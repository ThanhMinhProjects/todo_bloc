import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton()
class SharePrefService {
  final SharedPreferences _sharedPref;

  SharePrefService(this._sharedPref);

  static const String tokenKey = 'token';

  Future<bool> setToken(String token) async {
    try {
      return await _sharedPref.setString(tokenKey, token);
    } catch (e) {
      return false;
    }
  }

  Future<String?> getToken() async {
    try {
      return _sharedPref.getString(tokenKey);
    } catch (e) {
      return null;
    }
  }

  Future<bool> clearToken() async {
    try {
      return await _sharedPref.remove(tokenKey);
    } catch (e) {
      return false;
    }
  }
}

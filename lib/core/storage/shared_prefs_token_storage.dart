import 'package:kiedys_dojade/core/storage/token_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsTokenStorage implements TokenStorage {
  static const _key = 'auth_token';

  @override
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key);
  }

  @override
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, token);
  }

  @override
  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}

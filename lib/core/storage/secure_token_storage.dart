import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kiedys_dojade/core/storage/token_storage.dart';

class SecureTokenStorage implements TokenStorage {
  static const _key = 'auth_token';
  final _storage = const FlutterSecureStorage();

  @override
  Future<String?> getToken() => _storage.read(key: _key);

  @override
  Future<void> saveToken(String token) => _storage.write(key: _key, value: token);

  @override
  Future<void> clearToken() => _storage.delete(key: _key);
}

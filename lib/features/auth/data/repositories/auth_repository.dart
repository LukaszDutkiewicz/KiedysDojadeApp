import 'package:dio/dio.dart';
import 'package:kiedys_dojade/features/auth/data/models/auth_models.dart';

class AuthRepository {
  final Dio _dio;
  const AuthRepository(this._dio);

  // Backend uses GET /login with a request body (as per API spec)
  Future<String> login(String email, String password) async {
    final request = LoginRequest(email: email, password: password);
    final response = await _dio.post(
      'login',
      data: request.toJson(),
      options: Options(contentType: 'application/json'),
    );
    return AuthResponse.fromJson(response.data as Map<String, dynamic>).token;
  }

  Future<void> register(String email, String password, String username) async {
    final request = RegisterRequest(
      email: email,
      password: password,
      username: username,
    );
    await _dio.post('register', data: request.toJson());
  }
}

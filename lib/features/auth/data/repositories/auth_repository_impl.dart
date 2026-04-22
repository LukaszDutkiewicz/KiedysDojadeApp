import 'package:dio/dio.dart';
import 'package:kiedys_dojade/core/api/api_exceptions.dart';
import 'package:kiedys_dojade/features/auth/domain/entities/auth_models.dart';
import 'package:kiedys_dojade/features/auth/domain/exceptions/auth_exception.dart';
import 'package:kiedys_dojade/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Dio _dio;
  const AuthRepositoryImpl(this._dio);

  @override
  Future<String> login(String email, String password) async {
    try {
      final response = await _dio.post(
        'login',
        data: LoginRequest(email: email, password: password).toJson(),
      );
      return AuthResponse.fromJson(response.data as Map<String, dynamic>).token;
    } on DioException catch (e) {
      throw _mapToAuthException(mapDioException(e), forLogin: true);
    }
  }

  @override
  Future<void> register(String email, String password, String username) async {
    try {
      await _dio.post(
        'register',
        data: RegisterRequest(
          email: email,
          password: password,
          username: username,
        ).toJson(),
      );
    } on DioException catch (e) {
      throw _mapToAuthException(mapDioException(e), forLogin: false);
    }
  }

  AuthException _mapToAuthException(ApiException e, {required bool forLogin}) {
    return switch (e) {
      UnauthorizedException() when forLogin => const InvalidCredentialsException(),
      ConflictException() when !forLogin => const UserAlreadyExistsException(),
      _ => UnknownAuthException(e.message),
    };
  }
}

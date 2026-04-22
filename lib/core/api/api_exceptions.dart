import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

sealed class ApiException implements Exception {
  final String message;
  const ApiException(this.message);

  @override
  String toString() => message;
}

class NetworkException extends ApiException {
  const NetworkException() : super('Brak połączenia z serwerem. Sprawdź internet.');
}

class ServerException extends ApiException {
  const ServerException() : super('Błąd serwera. Spróbuj ponownie później.');
}

class TimeoutException extends ApiException {
  const TimeoutException() : super('Przekroczono czas oczekiwania na odpowiedź serwera.');
}

class UnauthorizedException extends ApiException {
  const UnauthorizedException() : super('Nieautoryzowany dostęp. Zaloguj się ponownie.');
}

class ValidationException extends ApiException {
  const ValidationException(this.errors) : super('Błąd walidacji danych.');
  final Map<String, List<String>> errors;
}

class ConflictException extends ApiException {
  const ConflictException() : super('Zasób już istnieje.');
}

class UnknownApiException extends ApiException {
  const UnknownApiException(super.message);
}

ApiException mapDioException(DioException e) {
  debugPrint('[API ERROR] type=${e.type} status=${e.response?.statusCode} message=${e.message} data=${e.response?.data} error=${e.error}');
  switch (e.type) {
    case DioExceptionType.connectionError:
      return const NetworkException();
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.sendTimeout:
      return const TimeoutException();
    case DioExceptionType.badResponse:
      final status = e.response?.statusCode;
      if (status == 401 || status == 403) return const UnauthorizedException();
      if (status == 409) return const ConflictException();
      if (status != null && status >= 500) return const ServerException();
      return UnknownApiException(
        e.response?.data?['message'] as String? ?? 'Nieznany błąd ($status).',
      );
    default:
      return UnknownApiException(e.message ?? 'Nieznany błąd.');
  }
}


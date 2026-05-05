import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kiedys_dojade/core/api/api_exceptions.dart';

RequestOptions get _opts => RequestOptions(path: '');

DioException _make({
  required DioExceptionType type,
  int? statusCode,
  dynamic data,
  String? message,
}) =>
    DioException(
      requestOptions: _opts,
      type: type,
      message: message,
      response: statusCode != null
          ? Response(
              requestOptions: _opts,
              statusCode: statusCode,
              data: data,
            )
          : null,
    );

void main() {
  group('mapDioException', () {
    // ------------------------------------------------------------------ //
    // connectionError
    // ------------------------------------------------------------------ //
    test('connectionError → NetworkException', () {
      final result = mapDioException(
        _make(type: DioExceptionType.connectionError),
      );
      expect(result, isA<NetworkException>());
    });

    // ------------------------------------------------------------------ //
    // timeout variants
    // ------------------------------------------------------------------ //
    group('timeout types all return TimeoutException', () {
      for (final type in const [
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ]) {
        test(type.name, () {
          expect(mapDioException(_make(type: type)), isA<TimeoutException>());
        });
      }
    });

    // ------------------------------------------------------------------ //
    // badResponse — auth
    // ------------------------------------------------------------------ //
    group('badResponse 401/403 → UnauthorizedException', () {
      for (final code in const [401, 403]) {
        test('HTTP $code', () {
          expect(
            mapDioException(_make(type: DioExceptionType.badResponse, statusCode: code)),
            isA<UnauthorizedException>(),
          );
        });
      }
    });

    // ------------------------------------------------------------------ //
    // badResponse — conflict
    // ------------------------------------------------------------------ //
    test('badResponse 409 → ConflictException', () {
      expect(
        mapDioException(_make(type: DioExceptionType.badResponse, statusCode: 409)),
        isA<ConflictException>(),
      );
    });

    // ------------------------------------------------------------------ //
    // badResponse — server errors
    // ------------------------------------------------------------------ //
    group('badResponse 5xx → ServerException', () {
      for (final code in const [500, 502, 503]) {
        test('HTTP $code', () {
          expect(
            mapDioException(_make(type: DioExceptionType.badResponse, statusCode: code)),
            isA<ServerException>(),
          );
        });
      }
    });

    // ------------------------------------------------------------------ //
    // badResponse — unknown 4xx with body message
    // ------------------------------------------------------------------ //
    test('badResponse 422 with data.message → UnknownApiException carrying that message', () {
      final result = mapDioException(
        _make(
          type: DioExceptionType.badResponse,
          statusCode: 422,
          data: {'message': 'Validation failed'},
        ),
      );
      expect(result, isA<UnknownApiException>());
      expect(result.message, 'Validation failed');
    });

    // ------------------------------------------------------------------ //
    // badResponse — unknown 4xx without body message
    // ------------------------------------------------------------------ //
    test('badResponse 404 with no data message → UnknownApiException with status in text', () {
      final result = mapDioException(
        _make(type: DioExceptionType.badResponse, statusCode: 404),
      );
      expect(result, isA<UnknownApiException>());
      expect(result.message, 'Nieznany błąd (404).');
    });

    // ------------------------------------------------------------------ //
    // badResponse — no status code at all
    // ------------------------------------------------------------------ //
    test('badResponse with null statusCode → UnknownApiException with "null" in text', () {
      final result = mapDioException(
        DioException(
          requestOptions: _opts,
          type: DioExceptionType.badResponse,
          response: Response(requestOptions: _opts, statusCode: null),
        ),
      );
      expect(result, isA<UnknownApiException>());
      expect(result.message, 'Nieznany błąd (null).');
    });

    // ------------------------------------------------------------------ //
    // default (cancel, badCertificate, unknown) branch
    // ------------------------------------------------------------------ //
    test('unknown type with message → UnknownApiException carrying that message', () {
      final result = mapDioException(
        _make(type: DioExceptionType.unknown, message: 'Something went wrong'),
      );
      expect(result, isA<UnknownApiException>());
      expect(result.message, 'Something went wrong');
    });

    test('cancel type with no message → UnknownApiException with fallback text', () {
      final result = mapDioException(_make(type: DioExceptionType.cancel));
      expect(result, isA<UnknownApiException>());
      expect(result.message, 'Nieznany błąd.');
    });

    test('badCertificate type → UnknownApiException', () {
      expect(
        mapDioException(_make(type: DioExceptionType.badCertificate)),
        isA<UnknownApiException>(),
      );
    });

    // ------------------------------------------------------------------ //
    // Every subtype is an Exception (implements ApiException → Exception)
    // ------------------------------------------------------------------ //
    test('every ApiException subtype implements Exception', () {
      expect(const NetworkException(), isA<Exception>());
      expect(const TimeoutException(), isA<Exception>());
      expect(const ServerException(), isA<Exception>());
      expect(const UnauthorizedException(), isA<Exception>());
      expect(const ConflictException(), isA<Exception>());
      expect(const UnknownApiException('x'), isA<Exception>());
    });

    // ------------------------------------------------------------------ //
    // toString() messages — guard against accidental copy-paste regressions
    // ------------------------------------------------------------------ //
    group('exception messages', () {
      test('NetworkException', () {
        expect(
          const NetworkException().toString(),
          'Brak połączenia z serwerem. Sprawdź internet.',
        );
      });

      test('TimeoutException', () {
        expect(
          const TimeoutException().toString(),
          'Przekroczono czas oczekiwania na odpowiedź serwera.',
        );
      });

      test('ServerException', () {
        expect(
          const ServerException().toString(),
          'Błąd serwera. Spróbuj ponownie później.',
        );
      });

      test('UnauthorizedException', () {
        expect(
          const UnauthorizedException().toString(),
          'Nieautoryzowany dostęp. Zaloguj się ponownie.',
        );
      });

      test('ConflictException', () {
        expect(
          const ConflictException().toString(),
          'Zasób już istnieje.',
        );
      });

      test('UnknownApiException carries custom message', () {
        expect(const UnknownApiException('custom').toString(), 'custom');
      });
    });
  });
}

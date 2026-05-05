import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kiedys_dojade/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:kiedys_dojade/features/auth/domain/exceptions/auth_exception.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

RequestOptions get _opts => RequestOptions(path: '');

Response<dynamic> _ok(dynamic data) =>
    Response(data: data, requestOptions: _opts, statusCode: 200);

DioException _dioErr(DioExceptionType type, {int? statusCode}) => DioException(
      requestOptions: _opts,
      type: type,
      response: statusCode != null
          ? Response(requestOptions: _opts, statusCode: statusCode)
          : null,
    );

void main() {
  late MockDio dio;
  late AuthRepositoryImpl repo;

  setUp(() {
    dio = MockDio();
    repo = AuthRepositoryImpl(dio);
  });

  // -------------------------------------------------------------------------
  // login()
  // -------------------------------------------------------------------------
  group('login', () {
    void stubPost(dynamic answer) {
      when(
        () => dio.post<dynamic>(
          any(),
          data: any(named: 'data'),
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
          cancelToken: any(named: 'cancelToken'),
          onSendProgress: any(named: 'onSendProgress'),
          onReceiveProgress: any(named: 'onReceiveProgress'),
        ),
      ).thenAnswer((_) async => answer);
    }

    void stubPostThrow(Object error) {
      when(
        () => dio.post<dynamic>(
          any(),
          data: any(named: 'data'),
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
          cancelToken: any(named: 'cancelToken'),
          onSendProgress: any(named: 'onSendProgress'),
          onReceiveProgress: any(named: 'onReceiveProgress'),
        ),
      ).thenThrow(error);
    }

    test('success returns token from response body', () async {
      stubPost(_ok({'token': 'secret-jwt'}));

      final token = await repo.login('user@example.com', 'pass123');

      expect(token, 'secret-jwt');
    });

    test('posts to "login" with email and password', () async {
      stubPost(_ok({'token': 'tok'}));

      await repo.login('a@b.com', 'pw');

      verify(
        () => dio.post<dynamic>(
          'login',
          data: {'email': 'a@b.com', 'password': 'pw'},
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
          cancelToken: any(named: 'cancelToken'),
          onSendProgress: any(named: 'onSendProgress'),
          onReceiveProgress: any(named: 'onReceiveProgress'),
        ),
      ).called(1);
    });

    test('401 → InvalidCredentialsException', () {
      stubPostThrow(_dioErr(DioExceptionType.badResponse, statusCode: 401));
      expect(
        () => repo.login('a@b.com', 'wrong'),
        throwsA(isA<InvalidCredentialsException>()),
      );
    });

    test('403 → InvalidCredentialsException', () {
      stubPostThrow(_dioErr(DioExceptionType.badResponse, statusCode: 403));
      expect(
        () => repo.login('a@b.com', 'wrong'),
        throwsA(isA<InvalidCredentialsException>()),
      );
    });

    test('409 during login → UnknownAuthException (conflict is not a login case)', () {
      stubPostThrow(_dioErr(DioExceptionType.badResponse, statusCode: 409));
      expect(
        () => repo.login('a@b.com', 'pw'),
        throwsA(isA<UnknownAuthException>()),
      );
    });

    test('500 → UnknownAuthException', () {
      stubPostThrow(_dioErr(DioExceptionType.badResponse, statusCode: 500));
      expect(
        () => repo.login('a@b.com', 'pw'),
        throwsA(isA<UnknownAuthException>()),
      );
    });

    test('network error → UnknownAuthException', () {
      stubPostThrow(_dioErr(DioExceptionType.connectionError));
      expect(
        () => repo.login('a@b.com', 'pw'),
        throwsA(isA<UnknownAuthException>()),
      );
    });
  });

  // -------------------------------------------------------------------------
  // register()
  // -------------------------------------------------------------------------
  group('register', () {
    void stubPost(dynamic answer) {
      when(
        () => dio.post<dynamic>(
          any(),
          data: any(named: 'data'),
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
          cancelToken: any(named: 'cancelToken'),
          onSendProgress: any(named: 'onSendProgress'),
          onReceiveProgress: any(named: 'onReceiveProgress'),
        ),
      ).thenAnswer((_) async => answer);
    }

    void stubPostThrow(Object error) {
      when(
        () => dio.post<dynamic>(
          any(),
          data: any(named: 'data'),
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
          cancelToken: any(named: 'cancelToken'),
          onSendProgress: any(named: 'onSendProgress'),
          onReceiveProgress: any(named: 'onReceiveProgress'),
        ),
      ).thenThrow(error);
    }

    test('success completes without throwing', () async {
      stubPost(_ok(null));
      await expectLater(
        repo.register('a@b.com', 'pw', 'alice'),
        completes,
      );
    });

    test('posts to "register" with email, password and username', () async {
      stubPost(_ok(null));

      await repo.register('a@b.com', 'pw', 'alice');

      verify(
        () => dio.post<dynamic>(
          'register',
          data: {'email': 'a@b.com', 'password': 'pw', 'username': 'alice'},
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
          cancelToken: any(named: 'cancelToken'),
          onSendProgress: any(named: 'onSendProgress'),
          onReceiveProgress: any(named: 'onReceiveProgress'),
        ),
      ).called(1);
    });

    test('409 → UserAlreadyExistsException', () {
      stubPostThrow(_dioErr(DioExceptionType.badResponse, statusCode: 409));
      expect(
        () => repo.register('a@b.com', 'pw', 'alice'),
        throwsA(isA<UserAlreadyExistsException>()),
      );
    });

    test('401 during register → UnknownAuthException (not an auth case)', () {
      stubPostThrow(_dioErr(DioExceptionType.badResponse, statusCode: 401));
      expect(
        () => repo.register('a@b.com', 'pw', 'alice'),
        throwsA(isA<UnknownAuthException>()),
      );
    });

    test('network error → UnknownAuthException', () {
      stubPostThrow(_dioErr(DioExceptionType.connectionError));
      expect(
        () => repo.register('a@b.com', 'pw', 'alice'),
        throwsA(isA<UnknownAuthException>()),
      );
    });
  });
}

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kiedys_dojade/core/api/api_exceptions.dart';
import 'package:kiedys_dojade/shared/data/repositories/stops_repository_impl.dart';
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

// ---------------------------------------------------------------------------
// Fixtures
// ---------------------------------------------------------------------------

Map<String, dynamic> _stopJson({
  int id = 1,
  String code = 'S1',
  String name = 'Stop One',
}) =>
    {
      'id': id,
      'code': code,
      'name': name,
      'lat': 51.1,
      'lon': 19.1,
      'zone_id': 'A',
    };

Map<String, dynamic> _stopGroupJson({
  String code = 'GRP1',
  String name = 'Group One',
}) =>
    {
      'group_code': code,
      'group_name': name,
      'lat': 51.1,
      'lon': 19.1,
    };

void main() {
  late MockDio dio;
  late StopsRepositoryImpl repo;

  setUp(() {
    dio = MockDio();
    repo = StopsRepositoryImpl(dio);
  });

  void stubGet(dynamic data) {
    when(
      () => dio.get<dynamic>(
        any(),
        queryParameters: any(named: 'queryParameters'),
        data: any(named: 'data'),
        options: any(named: 'options'),
        cancelToken: any(named: 'cancelToken'),
        onReceiveProgress: any(named: 'onReceiveProgress'),
      ),
    ).thenAnswer((_) async => _ok(data));
  }

  void stubGetThrow(Object error) {
    when(
      () => dio.get<dynamic>(
        any(),
        queryParameters: any(named: 'queryParameters'),
        data: any(named: 'data'),
        options: any(named: 'options'),
        cancelToken: any(named: 'cancelToken'),
        onReceiveProgress: any(named: 'onReceiveProgress'),
      ),
    ).thenThrow(error);
  }

  // -------------------------------------------------------------------------
  // getStops()
  // -------------------------------------------------------------------------
  group('getStops', () {
    test('success parses list of Stops', () async {
      stubGet([
        _stopJson(id: 1, code: 'S1', name: 'Stop One'),
        _stopJson(id: 2, code: 'S2', name: 'Stop Two'),
      ]);

      final result = await repo.getStops();

      expect(result.length, 2);
      expect(result[0].id, 1);
      expect(result[0].code, 'S1');
      expect(result[1].name, 'Stop Two');
    });

    test('calls /stops endpoint', () async {
      stubGet([]);

      await repo.getStops();

      verify(
        () => dio.get<dynamic>(
          '/stops',
          queryParameters: any(named: 'queryParameters'),
          data: any(named: 'data'),
          options: any(named: 'options'),
          cancelToken: any(named: 'cancelToken'),
          onReceiveProgress: any(named: 'onReceiveProgress'),
        ),
      ).called(1);
    });

    test('empty list returns empty list', () async {
      stubGet([]);
      expect(await repo.getStops(), isEmpty);
    });

    test('network error → NetworkException', () {
      stubGetThrow(_dioErr(DioExceptionType.connectionError));
      expect(() => repo.getStops(), throwsA(isA<NetworkException>()));
    });

    test('500 → ServerException', () {
      stubGetThrow(_dioErr(DioExceptionType.badResponse, statusCode: 500));
      expect(() => repo.getStops(), throwsA(isA<ServerException>()));
    });
  });

  // -------------------------------------------------------------------------
  // searchStops()
  // -------------------------------------------------------------------------
  group('searchStops', () {
    test('success parses matching stops', () async {
      stubGet([_stopJson(code: 'CEN', name: 'Centrum')]);

      final result = await repo.searchStops('cent');

      expect(result.length, 1);
      expect(result[0].name, 'Centrum');
    });

    test('passes query as "name" parameter', () async {
      stubGet([]);

      await repo.searchStops('centrum');

      verify(
        () => dio.get<dynamic>(
          '/stops/search',
          queryParameters: {'name': 'centrum'},
          data: any(named: 'data'),
          options: any(named: 'options'),
          cancelToken: any(named: 'cancelToken'),
          onReceiveProgress: any(named: 'onReceiveProgress'),
        ),
      ).called(1);
    });

    test('empty result returns empty list', () async {
      stubGet([]);
      expect(await repo.searchStops('xyz'), isEmpty);
    });

    test('network error → NetworkException', () {
      stubGetThrow(_dioErr(DioExceptionType.connectionError));
      expect(() => repo.searchStops('test'), throwsA(isA<NetworkException>()));
    });

    test('401 → UnauthorizedException', () {
      stubGetThrow(_dioErr(DioExceptionType.badResponse, statusCode: 401));
      expect(
        () => repo.searchStops('test'),
        throwsA(isA<UnauthorizedException>()),
      );
    });
  });

  // -------------------------------------------------------------------------
  // getStopGroupNames()
  // -------------------------------------------------------------------------
  group('getStopGroupNames', () {
    test('success parses list of StopGroups', () async {
      stubGet([
        _stopGroupJson(code: 'G1', name: 'Group One'),
        _stopGroupJson(code: 'G2', name: 'Group Two'),
      ]);

      final result = await repo.getStopGroupNames();

      expect(result.length, 2);
      expect(result[0].groupCode, 'G1');
      expect(result[0].groupName, 'Group One');
      expect(result[1].groupCode, 'G2');
    });

    test('calls /stops/groupnames endpoint', () async {
      stubGet([]);

      await repo.getStopGroupNames();

      verify(
        () => dio.get<dynamic>(
          '/stops/groupnames',
          queryParameters: any(named: 'queryParameters'),
          data: any(named: 'data'),
          options: any(named: 'options'),
          cancelToken: any(named: 'cancelToken'),
          onReceiveProgress: any(named: 'onReceiveProgress'),
        ),
      ).called(1);
    });

    test('empty list returns empty list', () async {
      stubGet([]);
      expect(await repo.getStopGroupNames(), isEmpty);
    });

    test('network error → NetworkException', () {
      stubGetThrow(_dioErr(DioExceptionType.connectionError));
      expect(
        () => repo.getStopGroupNames(),
        throwsA(isA<NetworkException>()),
      );
    });

    test('500 → ServerException', () {
      stubGetThrow(_dioErr(DioExceptionType.badResponse, statusCode: 500));
      expect(
        () => repo.getStopGroupNames(),
        throwsA(isA<ServerException>()),
      );
    });
  });
}

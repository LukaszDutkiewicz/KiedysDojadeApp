import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kiedys_dojade/core/api/api_exceptions.dart';
import 'package:kiedys_dojade/features/navigation/data/repositories/navigation_repository_impl.dart';
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

Map<String, dynamic> _stopJson({int id = 1, String code = 'S1'}) => {
      'id': id,
      'code': code,
      'name': 'Stop $code',
      'lat': 51.1,
      'lon': 19.1,
      'zone_id': 'A',
    };

Map<String, dynamic> _pathItemJson({
  required Map<String, dynamic> stop,
  String line = 'R1',
  String? departure = '10:00',
  String? arrival = '10:10',
}) =>
    {
      'stop': stop,
      'line': line,
      'departure_time': departure,
      'arrival_time': arrival,
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
  late NavigationRepositoryImpl repo;

  setUp(() {
    dio = MockDio();
    repo = NavigationRepositoryImpl(dio);
  });

  // Shared stub helpers
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
  // getPath()
  // -------------------------------------------------------------------------
  group('getPath', () {
    test('success parses nested list into PathResponse', () async {
      final itemJson = _pathItemJson(stop: _stopJson());
      stubGet([
        [itemJson],
        [itemJson, _pathItemJson(stop: _stopJson(id: 2, code: 'S2'))],
      ]);

      final result = await repo.getPath('S1', 'S2', '10:00', 2);

      expect(result.length, 2);
      expect(result[0].length, 1);
      expect(result[1].length, 2);
      expect(result[0][0].stop.code, 'S1');
      expect(result[0][0].departureTime, '10:00');
    });

    test('passes correct query parameters', () async {
      stubGet([]);

      await repo.getPath('START', 'END', '08:30', 3);

      verify(
        () => dio.get<dynamic>(
          'path',
          queryParameters: {
            'start_code': 'START',
            'end_code': 'END',
            'departure_time': '08:30',
            'limit': 3,
          },
          data: any(named: 'data'),
          options: any(named: 'options'),
          cancelToken: any(named: 'cancelToken'),
          onReceiveProgress: any(named: 'onReceiveProgress'),
        ),
      ).called(1);
    });

    test('empty response list returns empty PathResponse', () async {
      stubGet([]);
      final result = await repo.getPath('S1', 'S2', '10:00', null);
      expect(result, isEmpty);
    });

    test('walk leg has null line preserved', () async {
      final walkItemJson = _pathItemJson(
        stop: _stopJson(),
        line: 'WALK',
        departure: null,
        arrival: null,
      );
      stubGet([
        [walkItemJson],
      ]);

      final result = await repo.getPath('S1', 'S2', '10:00', null);
      expect(result[0][0].line, 'WALK');
      expect(result[0][0].departureTime, isNull);
    });

    test('DioException → ApiException is thrown', () {
      stubGetThrow(_dioErr(DioExceptionType.connectionError));
      expect(
        () => repo.getPath('S1', 'S2', '10:00', null),
        throwsA(isA<NetworkException>()),
      );
    });

    test('500 → ServerException', () {
      stubGetThrow(_dioErr(DioExceptionType.badResponse, statusCode: 500));
      expect(
        () => repo.getPath('S1', 'S2', '10:00', null),
        throwsA(isA<ServerException>()),
      );
    });
  });

  // -------------------------------------------------------------------------
  // getClosestStop()
  // -------------------------------------------------------------------------
  group('getClosestStop', () {
    test('success parses list of StopGroups', () async {
      stubGet([
        _stopGroupJson(code: 'GRP1', name: 'Group One'),
        _stopGroupJson(code: 'GRP2', name: 'Group Two'),
      ]);

      final result = await repo.getClosestStop(51.1, 19.1);

      expect(result.length, 2);
      expect(result[0].groupCode, 'GRP1');
      expect(result[1].groupName, 'Group Two');
    });

    test('passes lat/lon as query parameters', () async {
      stubGet([]);

      await repo.getClosestStop(51.5, 19.4);

      verify(
        () => dio.get<dynamic>(
          'stops/closest',
          queryParameters: {'lat': 51.5, 'lon': 19.4},
          data: any(named: 'data'),
          options: any(named: 'options'),
          cancelToken: any(named: 'cancelToken'),
          onReceiveProgress: any(named: 'onReceiveProgress'),
        ),
      ).called(1);
    });

    test('empty list returns empty list', () async {
      stubGet([]);
      final result = await repo.getClosestStop(0, 0);
      expect(result, isEmpty);
    });

    test('DioException → ApiException is thrown', () {
      stubGetThrow(_dioErr(DioExceptionType.connectionError));
      expect(
        () => repo.getClosestStop(51.1, 19.1),
        throwsA(isA<NetworkException>()),
      );
    });
  });
}

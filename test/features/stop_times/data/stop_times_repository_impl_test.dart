import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kiedys_dojade/core/api/api_exceptions.dart';
import 'package:kiedys_dojade/features/stop_times/data/repositories/stop_times_repository_impl.dart';
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

Map<String, dynamic> _stopTimeJson({
  String tripId = 'TRIP1',
  String routeId = 'R1',
  String headsign = 'City Center',
  String departure = '10:00:00',
  String arrival = '09:58:00',
  int stopId = 42,
  int stopSeq = 3,
}) =>
    {
      'trip_id': tripId,
      'arrival_time': arrival,
      'departure_time': departure,
      'stop_id': stopId,
      'stop_sequence': stopSeq,
      'stop_headsign': headsign,
      'route_id': routeId,
    };

void main() {
  late MockDio dio;
  late StopTimesRepositoryImpl repo;

  setUp(() {
    dio = MockDio();
    repo = StopTimesRepositoryImpl(dio);
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
  // getStopTimes()
  // -------------------------------------------------------------------------
  group('getStopTimes', () {
    test('success parses list of StopTimes', () async {
      stubGet([
        _stopTimeJson(tripId: 'T1', routeId: 'R1', headsign: 'North'),
        _stopTimeJson(tripId: 'T2', routeId: 'R2', headsign: 'South'),
      ]);

      final result = await repo.getStopTimes('STOP001');

      expect(result.length, 2);
      expect(result[0].tripId, 'T1');
      expect(result[0].routeId, 'R1');
      expect(result[0].stopHeadsign, 'North');
      expect(result[1].tripId, 'T2');
    });

    test('passes stop_code as query parameter', () async {
      stubGet([]);

      await repo.getStopTimes('STOP001');

      verify(
        () => dio.get<dynamic>(
          'stop_times/stop',
          queryParameters: {'stop_code': 'STOP001'},
          data: any(named: 'data'),
          options: any(named: 'options'),
          cancelToken: any(named: 'cancelToken'),
          onReceiveProgress: any(named: 'onReceiveProgress'),
        ),
      ).called(1);
    });

    test('empty list returns empty list', () async {
      stubGet([]);
      final result = await repo.getStopTimes('STOP001');
      expect(result, isEmpty);
    });

    test('optional pickupType and dropOffType are parsed when present', () async {
      final json = _stopTimeJson()
        ..['pickup_type'] = 0
        ..['drop_off_type'] = 1;
      stubGet([json]);

      final result = await repo.getStopTimes('S1');

      expect(result[0].pickupType, 0);
      expect(result[0].dropOffType, 1);
    });

    test('optional pickupType and dropOffType are null when absent', () async {
      stubGet([_stopTimeJson()]);
      final result = await repo.getStopTimes('S1');
      expect(result[0].pickupType, isNull);
      expect(result[0].dropOffType, isNull);
    });

    test('network error → NetworkException', () {
      stubGetThrow(_dioErr(DioExceptionType.connectionError));
      expect(
        () => repo.getStopTimes('STOP001'),
        throwsA(isA<NetworkException>()),
      );
    });

    test('401 → UnauthorizedException', () {
      stubGetThrow(_dioErr(DioExceptionType.badResponse, statusCode: 401));
      expect(
        () => repo.getStopTimes('STOP001'),
        throwsA(isA<UnauthorizedException>()),
      );
    });

    test('500 → ServerException', () {
      stubGetThrow(_dioErr(DioExceptionType.badResponse, statusCode: 500));
      expect(
        () => repo.getStopTimes('STOP001'),
        throwsA(isA<ServerException>()),
      );
    });

    test('timeout → TimeoutException', () {
      stubGetThrow(_dioErr(DioExceptionType.receiveTimeout));
      expect(
        () => repo.getStopTimes('STOP001'),
        throwsA(isA<TimeoutException>()),
      );
    });
  });
}

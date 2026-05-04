import 'package:dio/dio.dart';
import 'package:kiedys_dojade/core/api/api_exceptions.dart';
import 'package:kiedys_dojade/features/stop_times/domain/entities/stop_time.dart';
import 'package:kiedys_dojade/features/stop_times/domain/repositories/stop_times_repository.dart';

class StopTimesRepositoryImpl implements StopTimesRepository {
  final Dio _dio;
  const StopTimesRepositoryImpl(this._dio);

  @override
  Future<List<StopTime>> getStopTimes(String stopCode) async {
    try {
      final response = await _dio.get(
        'stop_times/stop',
        queryParameters: {'stop_code': stopCode},
      );
      return (response.data as List)
          .map((e) => StopTime.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }
}

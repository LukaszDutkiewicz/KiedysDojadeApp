import 'package:dio/dio.dart';
import 'package:kiedys_dojade/core/api/api_exceptions.dart';
import 'package:kiedys_dojade/shared/domain/entities/stop.dart';
import 'package:kiedys_dojade/shared/domain/entities/stop_group.dart';
import 'package:kiedys_dojade/shared/domain/repositories/stops_repository.dart';

class StopsRepositoryImpl implements StopsRepository {
  final Dio _dio;
  const StopsRepositoryImpl(this._dio);

  @override
  Future<List<Stop>> getStops() async {
    try {
      final response = await _dio.get('/stops');
      return (response.data as List)
          .map((json) => Stop.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  @override
  Future<Stop> getStopById(String id) async {
    try {
      final response = await _dio.get('/stops/$id');
      return Stop.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  @override
  Future<List<Stop>> searchStops(String query) async {
    try {
      final response = await _dio.get('/stops/search', queryParameters: {'name': query});
      return (response.data as List)
          .map((json) => Stop.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  @override
  Future<List<Stop>> getStopsByStopCode(String stopCode) async {
    try {
      final response = await _dio.get('/stops/code/$stopCode');
      return (response.data as List)
          .map((json) => Stop.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  @override
  Future<List<StopGroup>> getStopGroupNames() async {
    try {
      final response = await _dio.get('/stops/groupnames');
      return (response.data as List)
          .map((json) => StopGroup.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }
}

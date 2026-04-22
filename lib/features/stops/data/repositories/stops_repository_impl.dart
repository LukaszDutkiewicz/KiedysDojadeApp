import 'package:kiedys_dojade/features/stops/data/models/stop.dart';
import 'package:kiedys_dojade/core/api/api_provider.dart';
import 'package:kiedys_dojade/features/stops/domain/repositories/stops_repository.dart';
import 'package:kiedys_dojade/features/stops/data/repositories/stops_repository_provider.dart';
import 'package:dio/dio.dart';

class StopsRepositoryImpl implements StopsRepository {
  final Dio _dio;
  const StopsRepositoryImpl(this._dio);

  @override
  Future<List<Stop>> getStops() async {
    final response = await _apiClient.get('/stops');
    return (response.data as List)
        .map((json) => Stop.fromJson(json))
        .toList();
  }
}
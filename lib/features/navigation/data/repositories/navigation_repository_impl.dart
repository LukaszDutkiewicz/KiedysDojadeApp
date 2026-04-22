import 'package:dio/dio.dart';
import 'package:kiedys_dojade/core/api/api_exceptions.dart';
import 'package:kiedys_dojade/features/navigation/domain/entities/path_item.dart';
import 'package:kiedys_dojade/features/navigation/domain/repositories/navigation_repository.dart';

class NavigationRepositoryImpl implements NavigationRepository {
  final Dio _dio;
  NavigationRepositoryImpl(this._dio);

  @override
  Future<PathResponse> getPath(String start, String end, String? time, int? limit) async {
    try {
      final response = await _dio.get('path', queryParameters: {
        'start_code': start,
        'end_code': end,
        'departure_time': time,
        'limit': limit,
      });
      final List<dynamic> data = response.data;
      return data
          .map((list) => (list as List).map((item) => PathItem.fromJson(item as Map<String, dynamic>)).toList())
          .toList();
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }
}

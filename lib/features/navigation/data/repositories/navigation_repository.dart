// lib/features/navigation/data/navigation_repository.dart

import 'package:dio/dio.dart';
import 'package:kiedys_dojade/features/navigation/data/models/path_item.dart';

class NavigationRepository {
  final Dio _dio;
  NavigationRepository(this._dio);

  Future<PathResponse> getPath(String start, String end, String? time, int? limit) async {
    final response = await _dio.get('path', queryParameters: {
      'start_code': start,
      'end_code': end,
      'time': time,
      'limit': limit,
    });
    
    final List<dynamic> data = response.data;
    return data.map((list) => 
      (list as List).map((item) => PathItem.fromJson(item)).toList()
    ).toList();
  }
}
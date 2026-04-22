import 'package:kiedys_dojade/features/navigation/domain/entities/path_item.dart';

abstract interface class NavigationRepository {
  Future<PathResponse> getPath(String start, String end, String? time, int? limit);
}

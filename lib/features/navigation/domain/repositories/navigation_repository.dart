import 'package:kiedys_dojade/features/navigation/domain/entities/path_item.dart';
import 'package:kiedys_dojade/shared/domain/entities/stop_group.dart';

abstract interface class NavigationRepository {
  Future<PathResponse> getPath(String start, String end, String? time, int? limit);
  Future<List<StopGroup>> getClosestStop(double lat, double lon);
}

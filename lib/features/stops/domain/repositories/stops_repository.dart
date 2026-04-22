import 'package:kiedys_dojade/features/stops/domain/entities/stop.dart';
import 'package:kiedys_dojade/features/stops/domain/entities/stop_group.dart';

abstract interface class StopsRepository {
  Future<List<Stop>> getStops();
  Future<Stop> getStopById(String id);
  Future<List<Stop>> searchStops(String query);
  Future<List<Stop>> getStopsByStopCode(String stopCode);
  Future<List<StopGroup>> getStopGroupNames();
}
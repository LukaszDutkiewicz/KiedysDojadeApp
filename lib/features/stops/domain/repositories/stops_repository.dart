import 'package:kiedys_dojade/features/stops/data/models/stop.dart';

abstract interface class StopsRepository {
  Future<List<Stop>> getStops();
}
import 'package:kiedys_dojade/shared/domain/entities/stop.dart';
import '../entities/stop_time.dart';


abstract class StopTimesRepository {
  Future<List<Stop>> searchStopsByName(String query);
  Future<List<StopTime>> getStopTimes(String stopCode);

}
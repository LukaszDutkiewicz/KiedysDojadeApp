import 'package:kiedys_dojade/features/history/domain/entities/trip_history.dart';

abstract interface class HistoryRepository {
  Future<List<TripHistory>> getTripHistory();
  Future<void> addTrip({
    required String sourceCode,
    required String sourceName,
    required String destCode,
    required String destName,
    required String departureTime,
  });
}

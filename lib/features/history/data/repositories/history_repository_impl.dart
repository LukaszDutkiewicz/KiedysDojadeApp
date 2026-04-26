import 'package:drift/drift.dart';
import 'package:kiedys_dojade/core/database/app_database.dart';
import 'package:kiedys_dojade/features/history/domain/entities/trip_history.dart';
import 'package:kiedys_dojade/features/history/domain/repositories/history_repository.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final AppDatabase _db;
  HistoryRepositoryImpl(this._db);

  @override
  Future<List<TripHistory>> getTripHistory() async {
    final query = _db.select(_db.tripSearchHistories)
      ..orderBy([(t) => OrderingTerm.desc(t.searchedAt)]);
    final rows = await query.get();
    return rows.map(_mapRow).toList();
  }

  @override
  Future<void> addTrip({
    required String sourceCode,
    required String sourceName,
    required String destCode,
    required String destName,
    required String departureTime,
  }) =>
      _db.into(_db.tripSearchHistories).insert(
            TripSearchHistoriesCompanion.insert(
              sourceCode: sourceCode,
              sourceName: sourceName,
              destCode: destCode,
              destName: destName,
              departureTime: departureTime,
              searchedAt: DateTime.now(),
            ),
          );

  TripHistory _mapRow(TripSearchHistory row) => TripHistory(
        id: row.id,
        sourceCode: row.sourceCode,
        sourceName: row.sourceName,
        destCode: row.destCode,
        destName: row.destName,
        departureTime: row.departureTime,
        searchedAt: row.searchedAt,
      );
}

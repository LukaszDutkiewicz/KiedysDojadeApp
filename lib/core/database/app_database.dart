import 'package:drift/drift.dart';
import 'package:kiedys_dojade/core/database/tables/trip_search_histories_table.dart';

import 'connection/native.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [TripSearchHistories])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  AppDatabase.forTesting(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
    onUpgrade: (m, from, to) async {
      if (from < 2) await m.createTable(tripSearchHistories);
    },
  );
}

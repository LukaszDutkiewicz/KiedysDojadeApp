
import 'package:drift/drift.dart';

import 'connection/native.dart';

part 'app_database.g.dart';

class FavoriteStops  extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get stopId => text()();
  TextColumn get stopName => text()();
}

@DriftDatabase(tables: [FavoriteStops])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  AppDatabase.forTesting(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  @override MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async { await m.createAll(); }
  );

}
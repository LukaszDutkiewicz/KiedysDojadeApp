
import 'package:drift/drift.dart';

import 'connection/native.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  AppDatabase.forTesting(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  @override MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async { await m.createAll(); }
  );

}
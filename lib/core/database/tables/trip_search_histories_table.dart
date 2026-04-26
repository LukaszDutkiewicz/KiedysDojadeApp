import 'package:drift/drift.dart';

class TripSearchHistories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get sourceCode => text()();
  TextColumn get sourceName => text()();
  TextColumn get destCode => text()();
  TextColumn get destName => text()();
  TextColumn get departureTime => text()();
  DateTimeColumn get searchedAt => dateTime()();
}

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kiedys_dojade/core/database/app_database.dart';
import 'package:kiedys_dojade/features/history/data/repositories/history_repository_impl.dart';

// ---------------------------------------------------------------------------
// Helper — fresh in-memory database for each test
// ---------------------------------------------------------------------------
AppDatabase _memDb() => AppDatabase.forTesting(NativeDatabase.memory());

// Shorthand to insert a row with an explicit searchedAt for ordering tests.
Future<void> _insertDirect(
  AppDatabase db, {
  required String code,
  required DateTime searchedAt,
}) =>
    db.into(db.tripSearchHistories).insert(
          TripSearchHistoriesCompanion.insert(
            sourceCode: code,
            sourceName: 'Name $code',
            destCode: 'D$code',
            destName: 'Dest $code',
            departureTime: '10:00',
            searchedAt: searchedAt,
          ),
        );

void main() {
  late AppDatabase db;
  late HistoryRepositoryImpl repo;

  setUp(() {
    db = _memDb();
    repo = HistoryRepositoryImpl(db);
  });

  tearDown(() async => db.close());

  // -------------------------------------------------------------------------
  // Empty database
  // -------------------------------------------------------------------------
  test('getTripHistory on empty database returns empty list', () async {
    expect(await repo.getTripHistory(), isEmpty);
  });

  // -------------------------------------------------------------------------
  // addTrip + getTripHistory — field mapping
  // -------------------------------------------------------------------------
  group('addTrip then getTripHistory', () {
    test('returns exactly one entry', () async {
      await repo.addTrip(
        sourceCode: 'SRC01',
        sourceName: 'Centrum',
        destCode: 'DST02',
        destName: 'Lotnisko',
        departureTime: '08:45',
      );

      expect((await repo.getTripHistory()).length, 1);
    });

    test('all fields are mapped correctly', () async {
      await repo.addTrip(
        sourceCode: 'SRC01',
        sourceName: 'Centrum',
        destCode: 'DST02',
        destName: 'Lotnisko',
        departureTime: '08:45',
      );

      final entry = (await repo.getTripHistory()).first;

      expect(entry.sourceCode, 'SRC01');
      expect(entry.sourceName, 'Centrum');
      expect(entry.destCode, 'DST02');
      expect(entry.destName, 'Lotnisko');
      expect(entry.departureTime, '08:45');
    });

    test('id is auto-assigned and positive', () async {
      await repo.addTrip(
        sourceCode: 'A', sourceName: 'Alpha',
        destCode: 'B', destName: 'Beta',
        departureTime: '09:00',
      );

      expect((await repo.getTripHistory()).first.id, isPositive);
    });

    test('searchedAt is set close to the current time', () async {
      final before = DateTime.now().subtract(const Duration(seconds: 1));
      await repo.addTrip(
        sourceCode: 'A', sourceName: 'Alpha',
        destCode: 'B', destName: 'Beta',
        departureTime: '09:00',
      );
      final after = DateTime.now().add(const Duration(seconds: 1));

      final searchedAt = (await repo.getTripHistory()).first.searchedAt;
      expect(searchedAt.isAfter(before), isTrue);
      expect(searchedAt.isBefore(after), isTrue);
    });

    test('three calls each persist a separate entry', () async {
      for (final time in ['08:00', '09:00', '10:00']) {
        await repo.addTrip(
          sourceCode: 'A', sourceName: 'A',
          destCode: 'B', destName: 'B',
          departureTime: time,
        );
      }

      expect((await repo.getTripHistory()).length, 3);
    });

    test('each entry receives a unique auto-incremented id', () async {
      await repo.addTrip(
        sourceCode: 'A', sourceName: 'A', destCode: 'B', destName: 'B',
        departureTime: '08:00',
      );
      await repo.addTrip(
        sourceCode: 'C', sourceName: 'C', destCode: 'D', destName: 'D',
        departureTime: '09:00',
      );

      final result = await repo.getTripHistory();
      expect(result[0].id, isNot(equals(result[1].id)));
    });
  });

  // -------------------------------------------------------------------------
  // Ordering — newest first
  // -------------------------------------------------------------------------
  group('ordering', () {
    test('results are sorted newest-first (descending searchedAt)', () async {
      final oldest = DateTime(2024, 1, 1, 8, 0);
      final middle = DateTime(2024, 1, 1, 9, 0);
      final newest = DateTime(2024, 1, 1, 10, 0);

      // Inserted deliberately out of order to confirm the query sorts them.
      await _insertDirect(db, code: 'MID', searchedAt: middle);
      await _insertDirect(db, code: 'OLD', searchedAt: oldest);
      await _insertDirect(db, code: 'NEW', searchedAt: newest);

      final result = await repo.getTripHistory();

      expect(result.map((e) => e.sourceCode).toList(), ['NEW', 'MID', 'OLD']);
    });

    test('ordering holds across a larger set', () async {
      final base = DateTime(2024, 6, 1);
      for (var i = 0; i < 5; i++) {
        await _insertDirect(
          db,
          code: 'S$i',
          searchedAt: base.add(Duration(hours: i)),
        );
      }

      final result = await repo.getTripHistory();

      // Should come back in reverse insertion order: S4, S3, S2, S1, S0
      expect(
        result.map((e) => e.sourceCode).toList(),
        ['S4', 'S3', 'S2', 'S1', 'S0'],
      );
    });

    test('rows with equal searchedAt all appear without crashing', () async {
      final sameTime = DateTime(2024, 6, 1, 12, 0);
      for (var i = 0; i < 3; i++) {
        await _insertDirect(db, code: 'X$i', searchedAt: sameTime);
      }

      expect((await repo.getTripHistory()).length, 3);
    });
  });
}

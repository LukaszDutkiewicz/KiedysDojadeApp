import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'app_database.dart';

part 'database_provider.g.dart';

/// Dostarcza singleton [AppDatabase] dla całej aplikacji.
///
/// keepAlive: true — nie jest auto-dispose'owany, baza pozostaje otwarta.
/// ref.onDispose zamyka połączenie przy zamknięciu aplikacji.
@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
}

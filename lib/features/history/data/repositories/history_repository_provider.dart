import 'package:kiedys_dojade/core/database/database_provider.dart';
import 'package:kiedys_dojade/features/history/data/repositories/history_repository_impl.dart';
import 'package:kiedys_dojade/features/history/domain/repositories/history_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'history_repository_provider.g.dart';

@riverpod
HistoryRepository historyRepository(Ref ref) =>
    HistoryRepositoryImpl(ref.watch(appDatabaseProvider));

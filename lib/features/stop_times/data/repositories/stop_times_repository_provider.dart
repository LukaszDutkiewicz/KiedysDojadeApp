import 'package:kiedys_dojade/core/api/api_provider.dart';
import 'package:kiedys_dojade/features/stop_times/data/repositories/stop_times_repository_impl.dart';
import 'package:kiedys_dojade/features/stop_times/domain/repositories/stop_times_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stop_times_repository_provider.g.dart';

@riverpod
StopTimesRepository stopTimesRepository(Ref ref) =>
    StopTimesRepositoryImpl(ref.watch(dioProvider));

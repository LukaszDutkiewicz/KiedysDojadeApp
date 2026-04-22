import 'package:kiedys_dojade/core/api/api_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:kiedys_dojade/features/stops/data/models/stop.dart';
import 'package:kiedys_dojade/features/stops/domain/repositories/stops_repository.dart';
import 'package:kiedys_dojade/features/stops/data/repositories/stops_repository_impl.dart';


part 'stops_repository_provider.g.dart';

@riverpod
StopsRepository stopsRepository(Ref ref) {
  return StopsRepositoryImpl(ref.watch(dioProvider));
}
import 'package:kiedys_dojade/shared/data/repositories/stops_repository_provider.dart';
import 'package:kiedys_dojade/shared/domain/entities/stop.dart';
import 'package:kiedys_dojade/shared/domain/repositories/stops_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_stops.g.dart';

class SearchStopsUseCase {
  final StopsRepository _repository;
  const SearchStopsUseCase(this._repository);

  Future<List<Stop>> call(String query) => _repository.searchStops(query);
}

@riverpod
SearchStopsUseCase searchStopsUseCase(Ref ref) =>
    SearchStopsUseCase(ref.watch(stopsRepositoryProvider));

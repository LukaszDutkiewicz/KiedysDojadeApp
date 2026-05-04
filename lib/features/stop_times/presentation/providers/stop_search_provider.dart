import 'package:kiedys_dojade/shared/domain/entities/stop.dart';
import 'package:kiedys_dojade/shared/domain/usecases/get_stops.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stop_search_provider.g.dart';

@riverpod
class StopSearch extends _$StopSearch {
  @override
  Future<List<Stop>> build() async => [];

  Future<void> search(String query) async {
    if (query.trim().isEmpty) {
      state = const AsyncData([]);
      return;
    }
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(searchStopsUseCaseProvider).call(query),
    );
  }
}

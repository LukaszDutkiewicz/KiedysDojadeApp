import 'package:kiedys_dojade/features/navigation/data/models/path_item.dart';
import 'package:kiedys_dojade/features/navigation/data/repositories/navigation_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'trip_planner_provider.g.dart';

@riverpod
class TripPlannerNotifier extends _$TripPlannerNotifier {
  @override
  AsyncValue<PathResponse?> build() => const AsyncData(null);

  Future<void> search(String sourceCode, String destCode, String time) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(navigationRepositoryProvider).getPath(sourceCode, destCode, time, null),
    );
  }
}

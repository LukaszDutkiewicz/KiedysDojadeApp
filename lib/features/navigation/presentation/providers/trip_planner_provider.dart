import 'package:kiedys_dojade/features/navigation/domain/entities/path_item.dart';
import 'package:kiedys_dojade/features/navigation/domain/usecases/get_path_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'trip_planner_provider.g.dart';

@riverpod
class TripPlannerNotifier extends _$TripPlannerNotifier {
  @override
  AsyncValue<PathResponse?> build() => const AsyncData(null);

  Future<void> search(String sourceCode, String destCode, String time) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(getPathUseCaseProvider)(sourceCode, destCode, time),
    );
  }
}

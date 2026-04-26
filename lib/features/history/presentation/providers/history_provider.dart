import 'package:kiedys_dojade/features/history/domain/entities/trip_history.dart';
import 'package:kiedys_dojade/features/history/domain/usecases/add_trip_usecase.dart';
import 'package:kiedys_dojade/features/history/domain/usecases/get_trip_history_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'history_provider.g.dart';

@riverpod
class HistoryNotifier extends _$HistoryNotifier {
  @override
  Future<List<TripHistory>> build() =>
      ref.read(getTripHistoryUseCaseProvider)();

  Future<void> add({
    required String sourceCode,
    required String sourceName,
    required String destCode,
    required String destName,
    required String departureTime,
  }) async {
    await ref.read(addTripUseCaseProvider)(
      sourceCode: sourceCode,
      sourceName: sourceName,
      destCode: destCode,
      destName: destName,
      departureTime: departureTime,
    );
    ref.invalidateSelf();
  }
}

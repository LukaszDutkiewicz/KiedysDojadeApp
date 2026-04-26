import 'package:kiedys_dojade/features/history/data/repositories/history_repository_provider.dart';
import 'package:kiedys_dojade/features/history/domain/repositories/history_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_trip_usecase.g.dart';

class AddTripUseCase {
  final HistoryRepository _repository;
  const AddTripUseCase(this._repository);

  Future<void> call({
    required String sourceCode,
    required String sourceName,
    required String destCode,
    required String destName,
    required String departureTime,
  }) =>
      _repository.addTrip(
        sourceCode: sourceCode,
        sourceName: sourceName,
        destCode: destCode,
        destName: destName,
        departureTime: departureTime,
      );
}

@riverpod
AddTripUseCase addTripUseCase(Ref ref) =>
    AddTripUseCase(ref.watch(historyRepositoryProvider));

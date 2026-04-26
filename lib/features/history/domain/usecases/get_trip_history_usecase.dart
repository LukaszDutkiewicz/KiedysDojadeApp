import 'package:kiedys_dojade/features/history/data/repositories/history_repository_provider.dart';
import 'package:kiedys_dojade/features/history/domain/entities/trip_history.dart';
import 'package:kiedys_dojade/features/history/domain/repositories/history_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_trip_history_usecase.g.dart';

class GetTripHistoryUseCase {
  final HistoryRepository _repository;
  const GetTripHistoryUseCase(this._repository);

  Future<List<TripHistory>> call() => _repository.getTripHistory();
}

@riverpod
GetTripHistoryUseCase getTripHistoryUseCase(Ref ref) =>
    GetTripHistoryUseCase(ref.watch(historyRepositoryProvider));

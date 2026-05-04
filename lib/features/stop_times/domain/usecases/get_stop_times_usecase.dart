import 'package:kiedys_dojade/features/stop_times/data/repositories/stop_times_repository_provider.dart';
import 'package:kiedys_dojade/features/stop_times/domain/entities/stop_time.dart';
import 'package:kiedys_dojade/features/stop_times/domain/repositories/stop_times_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_stop_times_usecase.g.dart';

class GetStopTimesUseCase {
  final StopTimesRepository _repository;
  const GetStopTimesUseCase(this._repository);

  Future<List<StopTime>> call(String stopCode) =>
      _repository.getStopTimes(stopCode);
}

@riverpod
GetStopTimesUseCase getStopTimesUseCase(Ref ref) =>
    GetStopTimesUseCase(ref.watch(stopTimesRepositoryProvider));

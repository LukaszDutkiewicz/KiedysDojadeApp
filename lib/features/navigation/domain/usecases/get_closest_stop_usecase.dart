import 'package:kiedys_dojade/features/navigation/data/repositories/navigation_repository_provider.dart';
import 'package:kiedys_dojade/features/navigation/domain/repositories/navigation_repository.dart';
import 'package:kiedys_dojade/shared/domain/entities/stop_group.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_closest_stop_usecase.g.dart';

class GetClosestStopUseCase {
  final NavigationRepository _repository;
  const GetClosestStopUseCase(this._repository);

  Future<List<StopGroup>> call(double lat, double lon) =>
      _repository.getClosestStop(lat, lon);
}

@riverpod
GetClosestStopUseCase getClosestStopUseCase(Ref ref) =>
    GetClosestStopUseCase(ref.watch(navigationRepositoryProvider));

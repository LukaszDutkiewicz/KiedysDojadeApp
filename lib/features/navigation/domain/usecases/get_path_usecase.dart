import 'package:kiedys_dojade/features/navigation/data/repositories/navigation_repository_provider.dart';
import 'package:kiedys_dojade/features/navigation/domain/entities/path_item.dart';
import 'package:kiedys_dojade/features/navigation/domain/repositories/navigation_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_path_usecase.g.dart';

class GetPathUseCase {
  final NavigationRepository _repository;
  const GetPathUseCase(this._repository);

  Future<PathResponse> call(String start, String end, String time, {int? limit}) =>
      _repository.getPath(start, end, time, limit);
}

@riverpod
GetPathUseCase getPathUseCase(Ref ref) =>
    GetPathUseCase(ref.watch(navigationRepositoryProvider));

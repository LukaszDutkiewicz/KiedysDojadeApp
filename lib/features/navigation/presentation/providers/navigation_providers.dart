import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:kiedys_dojade/features/navigation/domain/entities/path_item.dart';
import 'package:kiedys_dojade/features/navigation/data/repositories/navigation_repository.dart';
import 'package:kiedys_dojade/core/api/api_provider.dart';

part 'navigation_providers.g.dart';

@riverpod
Future<PathResponse> pathFinder(
  Ref ref,
  String start,
  String end, {
  String? time,
  int? limit,
}) {
  final repo = NavigationRepository(ref.watch(dioProvider));
  return repo.getPath(start, end, time, limit);
}

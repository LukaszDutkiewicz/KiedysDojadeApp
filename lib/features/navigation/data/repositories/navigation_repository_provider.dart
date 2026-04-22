import 'package:kiedys_dojade/core/api/api_provider.dart';
import 'package:kiedys_dojade/features/navigation/data/repositories/navigation_repository_impl.dart';
import 'package:kiedys_dojade/features/navigation/domain/repositories/navigation_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_repository_provider.g.dart';

@riverpod
NavigationRepository navigationRepository(Ref ref) =>
    NavigationRepositoryImpl(ref.watch(dioProvider));

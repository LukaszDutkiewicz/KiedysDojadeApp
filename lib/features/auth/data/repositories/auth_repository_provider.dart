import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:kiedys_dojade/core/api/api_provider.dart';
import 'package:kiedys_dojade/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:kiedys_dojade/features/auth/domain/repositories/auth_repository.dart';

part 'auth_repository_provider.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryImpl(ref.watch(dioProvider));
}
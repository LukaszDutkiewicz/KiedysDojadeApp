import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:kiedys_dojade/features/auth/domain/repositories/auth_repository.dart';
import 'package:kiedys_dojade/features/auth/data/repositories/auth_repository_provider.dart';

part 'register_usecase.g.dart';

class RegisterUseCase {
  final AuthRepository _repository;
  const RegisterUseCase(this._repository);

  Future<void> call(String email, String password, String username) =>
      _repository.register(email, password, username);
}

@riverpod
RegisterUseCase registerUseCase(Ref ref) =>
    RegisterUseCase(ref.watch(authRepositoryProvider));

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:kiedys_dojade/features/auth/domain/repositories/auth_repository.dart';
import 'package:kiedys_dojade/features/auth/data/repositories/auth_repository_provider.dart';

part 'login_usecase.g.dart';

class LoginUseCase {
  final AuthRepository _repository;
  const LoginUseCase(this._repository);

  Future<String> call(String email, String password) =>
      _repository.login(email, password);
}

@riverpod
LoginUseCase loginUseCase(Ref ref) =>
    LoginUseCase(ref.watch(authRepositoryProvider));

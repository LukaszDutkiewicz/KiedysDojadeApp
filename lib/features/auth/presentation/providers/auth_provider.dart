import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:kiedys_dojade/core/storage/token_storage.dart';
import 'package:kiedys_dojade/features/auth/domain/usecases/login_usecase.dart';
import 'package:kiedys_dojade/features/auth/domain/usecases/register_usecase.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  final _storage = TokenStorage();

  @override
  Future<String?> build() => _storage.getToken();

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final token = await ref.read(loginUseCaseProvider)(email, password);
      await _storage.saveToken(token);
      return token;
    });
  }

  Future<void> register(String email, String password, String username) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(registerUseCaseProvider)(email, password, username);
      return null;
    });
  }

  Future<void> logout() async {
    await _storage.clearToken();
    state = const AsyncData(null);
  }
}

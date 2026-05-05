import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kiedys_dojade/core/storage/token_storage.dart';
import 'package:kiedys_dojade/core/storage/token_storage_provider.dart';
import 'package:kiedys_dojade/features/auth/data/repositories/auth_repository_provider.dart';
import 'package:kiedys_dojade/features/auth/domain/exceptions/auth_exception.dart';
import 'package:kiedys_dojade/features/auth/domain/repositories/auth_repository.dart';
import 'package:kiedys_dojade/features/auth/presentation/providers/auth_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockTokenStorage extends Mock implements TokenStorage {}

class MockAuthRepository extends Mock implements AuthRepository {}

// ---------------------------------------------------------------------------
// Helper — builds an isolated container with both deps mocked
// ---------------------------------------------------------------------------
ProviderContainer _container({
  required MockTokenStorage storage,
  required MockAuthRepository repo,
}) =>
    ProviderContainer(
      overrides: [
        tokenStorageProvider.overrideWithValue(storage),
        // loginUseCaseProvider and registerUseCaseProvider both watch
        // authRepositoryProvider, so overriding it is sufficient.
        authRepositoryProvider.overrideWithValue(repo),
      ],
    );

void main() {
  late MockTokenStorage storage;
  late MockAuthRepository repo;
  late ProviderContainer container;

  setUp(() {
    storage = MockTokenStorage();
    repo = MockAuthRepository();
    container = _container(storage: storage, repo: repo);
  });

  tearDown(() => container.dispose());

  // -------------------------------------------------------------------------
  // build() — initial load from storage
  // -------------------------------------------------------------------------
  group('build', () {
    test('stored token → state is AsyncData(token)', () async {
      when(() => storage.getToken()).thenAnswer((_) async => 'stored-jwt');

      final value = await container.read(authProvider.future);

      expect(value, 'stored-jwt');
    });

    test('no stored token → state is AsyncData(null)', () async {
      when(() => storage.getToken()).thenAnswer((_) async => null);

      final value = await container.read(authProvider.future);

      expect(value, isNull);
    });

    test('reads storage exactly once during initialisation', () async {
      when(() => storage.getToken()).thenAnswer((_) async => null);

      await container.read(authProvider.future);

      verify(() => storage.getToken()).called(1);
    });
  });

  // -------------------------------------------------------------------------
  // login()
  // -------------------------------------------------------------------------
  group('login', () {
    setUp(() =>
        when(() => storage.getToken()).thenAnswer((_) async => null));

    test('success → state becomes AsyncData(token)', () async {
      when(() => repo.login(any(), any())).thenAnswer((_) async => 'fresh-jwt');
      when(() => storage.saveToken(any())).thenAnswer((_) async {});

      await container.read(authProvider.future);
      await container.read(authProvider.notifier).login('a@b.com', 'pw');

      expect(container.read(authProvider).value, 'fresh-jwt');
    });

    test('success → token is persisted to storage', () async {
      when(() => repo.login(any(), any())).thenAnswer((_) async => 'fresh-jwt');
      when(() => storage.saveToken(any())).thenAnswer((_) async {});

      await container.read(authProvider.future);
      await container.read(authProvider.notifier).login('a@b.com', 'pw');

      verify(() => storage.saveToken('fresh-jwt')).called(1);
    });

    test('wrong credentials → state is AsyncError(InvalidCredentialsException)', () async {
      when(() => repo.login(any(), any()))
          .thenThrow(const InvalidCredentialsException());

      await container.read(authProvider.future);
      await container.read(authProvider.notifier).login('a@b.com', 'wrong');

      final state = container.read(authProvider);
      expect(state.hasError, isTrue);
      expect(state.error, isA<InvalidCredentialsException>());
    });

    test('failed login → token is NOT written to storage', () async {
      when(() => repo.login(any(), any()))
          .thenThrow(const InvalidCredentialsException());

      await container.read(authProvider.future);
      await container.read(authProvider.notifier).login('a@b.com', 'wrong');

      verifyNever(() => storage.saveToken(any()));
    });

    test('server error → state is AsyncError(UnknownAuthException)', () async {
      when(() => repo.login(any(), any()))
          .thenThrow(const UnknownAuthException('Serwer niedostępny'));

      await container.read(authProvider.future);
      await container.read(authProvider.notifier).login('a@b.com', 'pw');

      expect(
        container.read(authProvider).error,
        isA<UnknownAuthException>(),
      );
    });
  });

  // -------------------------------------------------------------------------
  // register()
  // -------------------------------------------------------------------------
  group('register', () {
    setUp(() =>
        when(() => storage.getToken()).thenAnswer((_) async => null));

    test('success → state becomes AsyncData(null)', () async {
      when(() => repo.register(any(), any(), any())).thenAnswer((_) async {});

      await container.read(authProvider.future);
      await container.read(authProvider.notifier)
          .register('a@b.com', 'pw', 'alice');

      final state = container.read(authProvider);
      expect(state.hasError, isFalse);
      expect(state.value, isNull);
    });

    test('conflict → state is AsyncError(UserAlreadyExistsException)', () async {
      when(() => repo.register(any(), any(), any()))
          .thenThrow(const UserAlreadyExistsException());

      await container.read(authProvider.future);
      await container.read(authProvider.notifier)
          .register('a@b.com', 'pw', 'alice');

      expect(
        container.read(authProvider).error,
        isA<UserAlreadyExistsException>(),
      );
    });

    test('register never touches token storage', () async {
      when(() => repo.register(any(), any(), any())).thenAnswer((_) async {});

      await container.read(authProvider.future);
      await container.read(authProvider.notifier)
          .register('a@b.com', 'pw', 'alice');

      verifyNever(() => storage.saveToken(any()));
      verifyNever(() => storage.clearToken());
    });
  });

  // -------------------------------------------------------------------------
  // logout()
  // -------------------------------------------------------------------------
  group('logout', () {
    test('clears storage and state becomes AsyncData(null)', () async {
      when(() => storage.getToken()).thenAnswer((_) async => 'stored-jwt');
      when(() => storage.clearToken()).thenAnswer((_) async {});

      await container.read(authProvider.future);
      await container.read(authProvider.notifier).logout();

      expect(container.read(authProvider).value, isNull);
      verify(() => storage.clearToken()).called(1);
    });

    test('logout when already logged out still calls clearToken', () async {
      when(() => storage.getToken()).thenAnswer((_) async => null);
      when(() => storage.clearToken()).thenAnswer((_) async {});

      await container.read(authProvider.future);
      await container.read(authProvider.notifier).logout();

      expect(container.read(authProvider).value, isNull);
      verify(() => storage.clearToken()).called(1);
    });

    test('logout does not call saveToken', () async {
      when(() => storage.getToken()).thenAnswer((_) async => 'stored-jwt');
      when(() => storage.clearToken()).thenAnswer((_) async {});

      await container.read(authProvider.future);
      await container.read(authProvider.notifier).logout();

      verifyNever(() => storage.saveToken(any()));
    });
  });
}

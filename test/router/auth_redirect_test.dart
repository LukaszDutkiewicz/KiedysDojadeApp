import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kiedys_dojade/features/auth/presentation/providers/auth_provider.dart';
import 'package:kiedys_dojade/features/auth/presentation/screens/login_screen.dart';
import 'package:kiedys_dojade/router/app_router.dart';
import 'package:kiedys_dojade/shared/presentation/pages/home_screen.dart';
import 'package:kiedys_dojade/main.dart';

// ---------------------------------------------------------------------------
// Fake notifiers
// ---------------------------------------------------------------------------

class _LoggedOutNotifier extends AuthNotifier {
  @override
  Future<String?> build() async => null;
}

class _LoggedInNotifier extends AuthNotifier {
  @override
  Future<String?> build() async => 'test-token';
}

void main() {
  group('auth redirect', () {
    testWidgets(
        'unauthenticated user navigating to /home is redirected to /login',
        (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [authProvider.overrideWith(_LoggedOutNotifier.new)],
          child: const MainApp(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(LoginScreen), findsOneWidget);
      expect(find.byType(HomeScreen), findsNothing);
    });

    testWidgets(
        'authenticated user navigating to /login is redirected to /home',
        (tester) async {
      // Use UncontrolledProviderScope so we can read appRouterProvider
      // and navigate programmatically after the initial render.
      final container = ProviderContainer(
        overrides: [authProvider.overrideWith(_LoggedInNotifier.new)],
      );
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MainApp(),
        ),
      );
      await tester.pumpAndSettle();
      // Initial location is /home — logged-in user stays there.
      expect(find.byType(HomeScreen), findsOneWidget);

      // Attempt to navigate to /login.
      container.read(appRouterProvider).go('/login');
      await tester.pumpAndSettle();

      // Redirect should fire and return us to /home.
      expect(find.byType(HomeScreen), findsOneWidget);
      expect(find.byType(LoginScreen), findsNothing);
    });
  });
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kiedys_dojade/features/auth/presentation/providers/auth_provider.dart';
import 'package:kiedys_dojade/features/auth/presentation/screens/login_screen.dart';

// ---------------------------------------------------------------------------
// Fake notifiers — subclass AuthNotifier so overrideWith() accepts them
// ---------------------------------------------------------------------------

/// Immediately resolves to logged-out state.
/// login() is overridden to be a no-op so submitting the form doesn't
/// spawn a real HTTP request (which would leave a pending timer).
class _LoggedOutNotifier extends AuthNotifier {
  @override
  Future<String?> build() async => null;

  @override
  Future<void> login(String email, String password) async {}
}

/// Never resolves — keeps state in AsyncLoading indefinitely.
class _PermanentlyLoadingNotifier extends AuthNotifier {
  @override
  Future<String?> build() => Completer<String?>().future;
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

Widget _buildScreen({required AuthNotifier Function() notifier}) =>
    ProviderScope(
      overrides: [authProvider.overrideWith(notifier)],
      child: const MaterialApp(home: LoginScreen()),
    );

Finder get _emailField => find.byType(TextFormField).at(0);
Finder get _passwordField => find.byType(TextFormField).at(1);
Finder get _submitButton => find.text('Zaloguj się');

void main() {
  group('LoginScreen — form validation', () {
    testWidgets('empty email shows "Podaj e-mail"', (tester) async {
      await tester.pumpWidget(_buildScreen(notifier: _LoggedOutNotifier.new));
      await tester.pumpAndSettle();

      await tester.enterText(_passwordField, 'secret123');
      await tester.tap(_submitButton);
      await tester.pump();

      expect(find.text('Podaj e-mail'), findsOneWidget);
    });

    testWidgets('email without @ shows format error', (tester) async {
      await tester.pumpWidget(_buildScreen(notifier: _LoggedOutNotifier.new));
      await tester.pumpAndSettle();

      await tester.enterText(_emailField, 'notanemail');
      await tester.enterText(_passwordField, 'secret123');
      await tester.tap(_submitButton);
      await tester.pump();

      expect(find.text('Podaj poprawny adres e-mail'), findsOneWidget);
    });

    testWidgets('email with @ but without . shows format error', (tester) async {
      await tester.pumpWidget(_buildScreen(notifier: _LoggedOutNotifier.new));
      await tester.pumpAndSettle();

      await tester.enterText(_emailField, 'user@nodot');
      await tester.enterText(_passwordField, 'secret123');
      await tester.tap(_submitButton);
      await tester.pump();

      expect(find.text('Podaj poprawny adres e-mail'), findsOneWidget);
    });

    testWidgets('empty password shows "Podaj hasło"', (tester) async {
      await tester.pumpWidget(_buildScreen(notifier: _LoggedOutNotifier.new));
      await tester.pumpAndSettle();

      await tester.enterText(_emailField, 'user@example.com');
      // leave password field empty
      await tester.tap(_submitButton);
      await tester.pump();

      expect(find.text('Podaj hasło'), findsOneWidget);
    });

    testWidgets('valid inputs produce no validation errors', (tester) async {
      await tester.pumpWidget(_buildScreen(notifier: _LoggedOutNotifier.new));
      await tester.pumpAndSettle();

      await tester.enterText(_emailField, 'user@example.com');
      await tester.enterText(_passwordField, 'secret123');
      await tester.tap(_submitButton);
      await tester.pump();

      expect(find.text('Podaj e-mail'), findsNothing);
      expect(find.text('Podaj hasło'), findsNothing);
      expect(find.text('Podaj poprawny adres e-mail'), findsNothing);
    });
  });

  group('LoginScreen — loading state', () {
    testWidgets('loading state disables the submit button', (tester) async {
      await tester.pumpWidget(
        _buildScreen(notifier: _PermanentlyLoadingNotifier.new),
      );
      // pump once — build() never resolves so pumpAndSettle would hang
      await tester.pump();

      final button = tester.widget<FilledButton>(find.byType(FilledButton));
      expect(button.onPressed, isNull);
    });

    testWidgets('loading state shows a CircularProgressIndicator inside the button',
        (tester) async {
      await tester.pumpWidget(
        _buildScreen(notifier: _PermanentlyLoadingNotifier.new),
      );
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      // The "Zaloguj się" text is replaced by the spinner
      expect(find.text('Zaloguj się'), findsNothing);
    });
  });
}

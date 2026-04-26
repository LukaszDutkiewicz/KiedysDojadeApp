import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:kiedys_dojade/features/auth/presentation/providers/auth_provider.dart';
import 'package:kiedys_dojade/features/auth/presentation/screens/login_screen.dart';
import 'package:kiedys_dojade/features/auth/presentation/screens/register_screen.dart';
import 'package:kiedys_dojade/shared/presentation/pages/error_screen.dart';
import 'package:kiedys_dojade/features/navigation/domain/entities/path_item.dart';
import 'package:kiedys_dojade/features/navigation/presentation/screens/path_map_screen.dart';
import 'package:kiedys_dojade/features/navigation/presentation/screens/trip_planner_screen.dart';
import 'package:kiedys_dojade/features/history/domain/entities/trip_history.dart';
import 'package:kiedys_dojade/features/history/presentation/screens/history_screen.dart';
import 'package:kiedys_dojade/shared/presentation/pages/home_screen.dart';

part 'app_router.g.dart';

class _RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  _RouterNotifier(this._ref) {
    _ref.listen(authProvider, (prev, next) => notifyListeners());
  }

  String? redirect(BuildContext context, GoRouterState state) {
    final authValue = _ref.read(authProvider);

    // While loading the token from storage, stay put
    if (authValue.isLoading) return null;

    final isLoggedIn = authValue is AsyncData && authValue.value != null;
    final isAuthRoute =
        state.matchedLocation == '/login' || state.matchedLocation == '/register';

    if (!isLoggedIn && !isAuthRoute) return '/login';
    if (isLoggedIn && isAuthRoute) return '/home';
    return null;
  }
}

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final notifier = _RouterNotifier(ref);
  return GoRouter(
    initialLocation: '/home',
    refreshListenable: notifier,
    redirect: notifier.redirect,
    routes: [
      GoRoute(
        path: '/login',
        builder: (_, __) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (_, __) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (_, __) => const HomeScreen(),
      ),
      GoRoute(
        path: '/trip-planner',
        builder: (_, state) => TripPlannerScreen(
          historyEntry: state.extra as TripHistory?,
        ),
      ),
      GoRoute(
        path: '/history',
        builder: (_, __) => const HistoryScreen(),
      ),
      GoRoute(
        path: '/path-map',
        builder: (_, state) => PathMapScreen(
          proposal: state.extra as PathProposal,
        ),
      ),
    ],
    errorBuilder: (context, state) => DemoErrorScreen(
      title: 'Błąd',
      message: state.error.toString(),
    ),
  );
}


import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:kiedys_dojade/features/error/presentation/pages/error_page.dart';



part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) => GoRouter(
  initialLocation: '/',
  routes: [],
  errorBuilder: (context, state) => DemoErrorScreen(
    title: 'Błąd',
    message: state.error.toString(),
  ),
);
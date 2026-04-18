
import 'package:go_router/go_router.dart';


part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) => GoRouter(
  initialLocation: '/',
  routes: [],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text(state.error.toString()),
    ),
  ),
);
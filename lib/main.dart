import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kiedys_dojade/features/auth/presentation/providers/auth_provider.dart';

import 'router/app_router.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}


class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);


    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'KiedysDojade',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

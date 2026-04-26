import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kiedys_dojade/features/auth/presentation/providers/auth_provider.dart';
import 'package:kiedys_dojade/features/history/domain/entities/trip_history.dart';
import 'package:kiedys_dojade/features/navigation/presentation/widgets/trip_planner_widget.dart';

class TripPlannerScreen extends ConsumerWidget {
  const TripPlannerScreen({super.key, this.historyEntry});

  final TripHistory? historyEntry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zaplanuj trasę'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => ref.read(authProvider.notifier).logout(),
          ),
        ],
      ),
      body: TripPlannerWidget(
        initialSourceCode: historyEntry?.sourceCode,
        initialSourceName: historyEntry?.sourceName,
        initialDestCode: historyEntry?.destCode,
        initialDestName: historyEntry?.destName,
        initialTime: historyEntry?.departureTime,
      ),
    );
  }
}

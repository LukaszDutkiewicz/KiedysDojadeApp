import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kiedys_dojade/features/stop_times/presentation/providers/stop_times_provider.dart';

class StopDetailsWidget extends ConsumerWidget {
  const StopDetailsWidget({super.key, required this.stopCode});

  final String stopCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stopTimes = ref.watch(stopTimesProvider(stopCode));

    return stopTimes.when(
      data: (times) {
        if (times.isEmpty) {
          return const Center(child: Text('Brak odjazdów.'));
        }
        return ListView.builder(
          itemCount: times.length,
          itemBuilder: (context, index) {
            final t = times[index];
            return ListTile(
              leading: CircleAvatar(child: Text(t.routeId)),
              title: Text(t.stopHeadsign),
              trailing: Text(
                t.departureTime,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('Błąd: $err')),
    );
  }
}
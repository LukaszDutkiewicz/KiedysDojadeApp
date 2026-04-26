// Widget wyświetlający listę odjazdów
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StopDetailsWidget extends ConsumerWidget {
  final String stopCode;
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // subskrypcja providera, który woła repozytorium
    final stopTimes = ref.watch(stopTimesProvider(stopCode));

    return stopTimes.when(
      data: (times) => ListView.builder(
        itemCount: times.length,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(child: Text(times[index].line)),
          title: Text(times[index].direction),
          trailing: Text(times[index].departureTime, 
             style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Błąd: $err')),
    );
  }
}
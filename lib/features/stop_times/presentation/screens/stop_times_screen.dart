import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kiedys_dojade/features/stop_times/presentation/providers/stop_search_provider.dart';
import 'package:kiedys_dojade/shared/domain/entities/stop.dart';

class StopTimesScreen extends ConsumerStatefulWidget {
  const StopTimesScreen({super.key});

  @override
  ConsumerState<StopTimesScreen> createState() => _StopTimesScreenState();
}

class _StopTimesScreenState extends ConsumerState<StopTimesScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(stopSearchProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Rozkład jazdy')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _controller,
              autofocus: true,
              decoration: InputDecoration(
                labelText: 'Szukaj przystanku',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _controller.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _controller.clear();
                          ref.read(stopSearchProvider.notifier).search('');
                        },
                      )
                    : null,
              ),
              onChanged: (v) =>
                  ref.read(stopSearchProvider.notifier).search(v),
            ),
          ),
          Expanded(
            child: searchState.when(
              data: (stops) {
                if (stops.isEmpty) {
                  return Center(
                    child: Text(
                      _controller.text.isEmpty
                          ? 'Wpisz nazwę przystanku'
                          : 'Brak wyników',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  );
                }
                return ListView.separated(
                  itemCount: stops.length,
                  separatorBuilder: (_, _) => const Divider(height: 1),
                  itemBuilder: (_, i) => _StopTile(stop: stops[i]),
                );
              },
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Błąd: $e')),
            ),
          ),
        ],
      ),
    );
  }
}

class _StopTile extends StatelessWidget {
  const _StopTile({required this.stop});
  final Stop stop;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.directions_bus_outlined),
      title: Text(stop.name),
      subtitle: Text(stop.code),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => context.push('/stop-times/detail', extra: stop),
    );
  }
}

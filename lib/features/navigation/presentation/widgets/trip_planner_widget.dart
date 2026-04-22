import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kiedys_dojade/features/navigation/domain/entities/path_item.dart';
import 'package:kiedys_dojade/features/navigation/presentation/providers/trip_planner_provider.dart';
import 'package:kiedys_dojade/features/stops/domain/entities/stop_group.dart';
import 'package:kiedys_dojade/features/stops/presentation/providers/stop_groups_provider.dart';

class TripPlannerWidget extends ConsumerStatefulWidget {
  const TripPlannerWidget({super.key});

  @override
  ConsumerState<TripPlannerWidget> createState() => _TripPlannerWidgetState();
}

class _TripPlannerWidgetState extends ConsumerState<TripPlannerWidget> {
  StopGroup? _source;
  StopGroup? _destination;
  TimeOfDay _time = TimeOfDay.now();

  String _formatTime(TimeOfDay t) =>
      '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';

  Future<void> _pickTime() async {
    final picked = await showTimePicker(context: context, initialTime: _time);
    if (picked != null) setState(() => _time = picked);
  }

  void _search() {
    final source = _source;
    final destination = _destination;
    if (source == null || destination == null) return;
    ref.read(tripPlannerProvider.notifier).search(
          source.groupCode,
          destination.groupCode,
          _formatTime(_time),
        );
  }

  @override
  Widget build(BuildContext context) {
    final stopGroupsAsync = ref.watch(stopGroupsProvider);
    final results = ref.watch(tripPlannerProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          stopGroupsAsync.when(
            data: _buildForm,
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Text('Błąd ładowania przystanków: $e'),
          ),
          const SizedBox(height: 24),
          _buildResults(results),
        ],
      ),
    );
  }

  Widget _buildForm(List<StopGroup> groups) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _StopGroupAutocomplete(
          label: 'Skąd',
          groups: groups,
          onSelected: (g) => setState(() => _source = g),
        ),
        const SizedBox(height: 12),
        _StopGroupAutocomplete(
          label: 'Dokąd',
          groups: groups,
          onSelected: (g) => setState(() => _destination = g),
        ),
        const SizedBox(height: 12),
        InkWell(
          onTap: _pickTime,
          child: InputDecorator(
            decoration: const InputDecoration(
              labelText: 'Godzina odjazdu',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.access_time),
            ),
            child: Text(_formatTime(_time)),
          ),
        ),
        const SizedBox(height: 16),
        FilledButton(
          onPressed: _source != null && _destination != null ? _search : null,
          child: const Text('Szukaj połączenia'),
        ),
      ],
    );
  }

  Widget _buildResults(AsyncValue<PathResponse?> results) {
    return results.when(
      data: (data) {
        if (data == null) return const SizedBox.shrink();
        if (data.isEmpty) return const Center(child: Text('Brak połączeń.'));
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: data.length,
          separatorBuilder: (_, _) => const Divider(),
          itemBuilder: (_, i) => _ProposalTile(proposal: data[i], index: i + 1),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Text('Błąd: $e', style: TextStyle(color: Theme.of(context).colorScheme.error)),
    );
  }
}

class _StopGroupAutocomplete extends StatelessWidget {
  const _StopGroupAutocomplete({
    required this.label,
    required this.groups,
    required this.onSelected,
  });

  final String label;
  final List<StopGroup> groups;
  final ValueChanged<StopGroup> onSelected;

  @override
  Widget build(BuildContext context) {
    return Autocomplete<StopGroup>(
      displayStringForOption: (g) => g.groupName,
      optionsBuilder: (value) {
        if (value.text.isEmpty) return const [];
        final query = value.text.toLowerCase();
        return groups.where((g) => g.groupName.toLowerCase().contains(query));
      },
      onSelected: onSelected,
      fieldViewBuilder: (context, controller, focusNode, _) => TextField(
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

class _ProposalTile extends StatelessWidget {
  const _ProposalTile({required this.proposal, required this.index});

  final PathProposal proposal;
  final int index;

  @override
  Widget build(BuildContext context) {
    final first = proposal.first;
    final last = proposal.last;
    return ExpansionTile(
      title: Text('Propozycja $index'),
      subtitle: Text(
        '${first.stop.name} → ${last.stop.name}'
        '  ${first.departureTime ?? ''}–${last.arrivalTime ?? ''}',
      ),
      trailing: IconButton(
        icon: const Icon(Icons.map_outlined),
        onPressed: () => context.push('/path-map', extra: proposal),
      ),
      children: proposal
          .map(
            (item) => ListTile(
              leading: item.line != null
                  ? Chip(label: Text(item.line!))
                  : const SizedBox(width: 40),
              title: Text(item.stop.name),
              trailing: Text('${item.departureTime ?? ''}→${item.arrivalTime ?? ''}'),
            ),
          )
          .toList(),
    );
  }
}

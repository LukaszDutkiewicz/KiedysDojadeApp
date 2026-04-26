import 'package:kiedys_dojade/shared/data/repositories/stops_repository_provider.dart';
import 'package:kiedys_dojade/shared/domain/entities/stop_group.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stop_groups_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<StopGroup>> stopGroups(Ref ref) =>
    ref.watch(stopsRepositoryProvider).getStopGroupNames();

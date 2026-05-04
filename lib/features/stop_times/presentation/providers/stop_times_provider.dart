import 'package:kiedys_dojade/features/stop_times/domain/entities/stop_time.dart';
import 'package:kiedys_dojade/features/stop_times/domain/usecases/get_stop_times_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stop_times_provider.g.dart';

@riverpod
Future<List<StopTime>> stopTimes(Ref ref, String stopCode) =>
    ref.watch(getStopTimesUseCaseProvider).call(stopCode);

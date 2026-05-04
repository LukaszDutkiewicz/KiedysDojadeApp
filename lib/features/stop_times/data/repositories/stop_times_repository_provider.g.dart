// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop_times_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(stopTimesRepository)
final stopTimesRepositoryProvider = StopTimesRepositoryProvider._();

final class StopTimesRepositoryProvider
    extends
        $FunctionalProvider<
          StopTimesRepository,
          StopTimesRepository,
          StopTimesRepository
        >
    with $Provider<StopTimesRepository> {
  StopTimesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stopTimesRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stopTimesRepositoryHash();

  @$internal
  @override
  $ProviderElement<StopTimesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  StopTimesRepository create(Ref ref) {
    return stopTimesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StopTimesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StopTimesRepository>(value),
    );
  }
}

String _$stopTimesRepositoryHash() =>
    r'c3eda02948a483ab2812d1f43785bfb2ac87ab3d';

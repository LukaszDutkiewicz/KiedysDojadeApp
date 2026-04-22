// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_planner_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TripPlannerNotifier)
final tripPlannerProvider = TripPlannerNotifierProvider._();

final class TripPlannerNotifierProvider
    extends $NotifierProvider<TripPlannerNotifier, AsyncValue<PathResponse?>> {
  TripPlannerNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tripPlannerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tripPlannerNotifierHash();

  @$internal
  @override
  TripPlannerNotifier create() => TripPlannerNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<PathResponse?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<PathResponse?>>(value),
    );
  }
}

String _$tripPlannerNotifierHash() =>
    r'c4a03f7ef403383222be640ae3c120a956b9f55d';

abstract class _$TripPlannerNotifier
    extends $Notifier<AsyncValue<PathResponse?>> {
  AsyncValue<PathResponse?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<PathResponse?>, AsyncValue<PathResponse?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PathResponse?>, AsyncValue<PathResponse?>>,
              AsyncValue<PathResponse?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

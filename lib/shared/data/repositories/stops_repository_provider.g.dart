// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stops_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(stopsRepository)
final stopsRepositoryProvider = StopsRepositoryProvider._();

final class StopsRepositoryProvider
    extends
        $FunctionalProvider<StopsRepository, StopsRepository, StopsRepository>
    with $Provider<StopsRepository> {
  StopsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stopsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stopsRepositoryHash();

  @$internal
  @override
  $ProviderElement<StopsRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  StopsRepository create(Ref ref) {
    return stopsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StopsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StopsRepository>(value),
    );
  }
}

String _$stopsRepositoryHash() => r'5339856196ff9dd07fb31e230148708e134e2c76';

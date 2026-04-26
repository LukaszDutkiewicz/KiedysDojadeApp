// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_trip_history_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getTripHistoryUseCase)
final getTripHistoryUseCaseProvider = GetTripHistoryUseCaseProvider._();

final class GetTripHistoryUseCaseProvider
    extends
        $FunctionalProvider<
          GetTripHistoryUseCase,
          GetTripHistoryUseCase,
          GetTripHistoryUseCase
        >
    with $Provider<GetTripHistoryUseCase> {
  GetTripHistoryUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getTripHistoryUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getTripHistoryUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetTripHistoryUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetTripHistoryUseCase create(Ref ref) {
    return getTripHistoryUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetTripHistoryUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetTripHistoryUseCase>(value),
    );
  }
}

String _$getTripHistoryUseCaseHash() =>
    r'eb3fe8310bee55fb3440e14031a0d3b3fd17f6bd';

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_closest_stop_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getClosestStopUseCase)
final getClosestStopUseCaseProvider = GetClosestStopUseCaseProvider._();

final class GetClosestStopUseCaseProvider
    extends
        $FunctionalProvider<
          GetClosestStopUseCase,
          GetClosestStopUseCase,
          GetClosestStopUseCase
        >
    with $Provider<GetClosestStopUseCase> {
  GetClosestStopUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getClosestStopUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getClosestStopUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetClosestStopUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetClosestStopUseCase create(Ref ref) {
    return getClosestStopUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetClosestStopUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetClosestStopUseCase>(value),
    );
  }
}

String _$getClosestStopUseCaseHash() =>
    r'214f85fefe4410c74c8809608d44647706d5d82e';

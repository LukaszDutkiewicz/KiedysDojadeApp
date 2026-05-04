// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_stop_times_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getStopTimesUseCase)
final getStopTimesUseCaseProvider = GetStopTimesUseCaseProvider._();

final class GetStopTimesUseCaseProvider
    extends
        $FunctionalProvider<
          GetStopTimesUseCase,
          GetStopTimesUseCase,
          GetStopTimesUseCase
        >
    with $Provider<GetStopTimesUseCase> {
  GetStopTimesUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getStopTimesUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getStopTimesUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetStopTimesUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetStopTimesUseCase create(Ref ref) {
    return getStopTimesUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetStopTimesUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetStopTimesUseCase>(value),
    );
  }
}

String _$getStopTimesUseCaseHash() =>
    r'a6688086f808926e23f765b164b0837265aae76b';

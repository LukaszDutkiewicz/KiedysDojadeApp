// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_path_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getPathUseCase)
final getPathUseCaseProvider = GetPathUseCaseProvider._();

final class GetPathUseCaseProvider
    extends $FunctionalProvider<GetPathUseCase, GetPathUseCase, GetPathUseCase>
    with $Provider<GetPathUseCase> {
  GetPathUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getPathUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getPathUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetPathUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetPathUseCase create(Ref ref) {
    return getPathUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetPathUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetPathUseCase>(value),
    );
  }
}

String _$getPathUseCaseHash() => r'd4d476b67a35150f0f956bf5edbabd9728de578b';

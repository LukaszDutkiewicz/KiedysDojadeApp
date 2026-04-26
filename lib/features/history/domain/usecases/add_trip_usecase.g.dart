// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_trip_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(addTripUseCase)
final addTripUseCaseProvider = AddTripUseCaseProvider._();

final class AddTripUseCaseProvider
    extends $FunctionalProvider<AddTripUseCase, AddTripUseCase, AddTripUseCase>
    with $Provider<AddTripUseCase> {
  AddTripUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addTripUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addTripUseCaseHash();

  @$internal
  @override
  $ProviderElement<AddTripUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AddTripUseCase create(Ref ref) {
    return addTripUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddTripUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddTripUseCase>(value),
    );
  }
}

String _$addTripUseCaseHash() => r'05288988927a8dd9aee4455a9673f895f5f311bd';

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_stops.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(searchStopsUseCase)
final searchStopsUseCaseProvider = SearchStopsUseCaseProvider._();

final class SearchStopsUseCaseProvider
    extends
        $FunctionalProvider<
          SearchStopsUseCase,
          SearchStopsUseCase,
          SearchStopsUseCase
        >
    with $Provider<SearchStopsUseCase> {
  SearchStopsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchStopsUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchStopsUseCaseHash();

  @$internal
  @override
  $ProviderElement<SearchStopsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SearchStopsUseCase create(Ref ref) {
    return searchStopsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SearchStopsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SearchStopsUseCase>(value),
    );
  }
}

String _$searchStopsUseCaseHash() =>
    r'862b6075ebfe24b31cd50eed453868bac7083985';

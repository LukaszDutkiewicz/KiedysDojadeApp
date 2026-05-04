// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop_search_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(StopSearch)
final stopSearchProvider = StopSearchProvider._();

final class StopSearchProvider
    extends $AsyncNotifierProvider<StopSearch, List<Stop>> {
  StopSearchProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stopSearchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stopSearchHash();

  @$internal
  @override
  StopSearch create() => StopSearch();
}

String _$stopSearchHash() => r'6bad55cfd433183ad7f64323d0b858872f78929c';

abstract class _$StopSearch extends $AsyncNotifier<List<Stop>> {
  FutureOr<List<Stop>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Stop>>, List<Stop>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Stop>>, List<Stop>>,
              AsyncValue<List<Stop>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

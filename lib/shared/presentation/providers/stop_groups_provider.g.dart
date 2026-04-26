// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop_groups_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(stopGroups)
final stopGroupsProvider = StopGroupsProvider._();

final class StopGroupsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<StopGroup>>,
          List<StopGroup>,
          FutureOr<List<StopGroup>>
        >
    with $FutureModifier<List<StopGroup>>, $FutureProvider<List<StopGroup>> {
  StopGroupsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stopGroupsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stopGroupsHash();

  @$internal
  @override
  $FutureProviderElement<List<StopGroup>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<StopGroup>> create(Ref ref) {
    return stopGroups(ref);
  }
}

String _$stopGroupsHash() => r'011d9de4b5c3b5cef30ab4fce6e81c182c6ebfa1';

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pathFinder)
final pathFinderProvider = PathFinderFamily._();

final class PathFinderProvider
    extends
        $FunctionalProvider<
          AsyncValue<PathResponse>,
          PathResponse,
          FutureOr<PathResponse>
        >
    with $FutureModifier<PathResponse>, $FutureProvider<PathResponse> {
  PathFinderProvider._({
    required PathFinderFamily super.from,
    required (String, String, {String? time, int? limit}) super.argument,
  }) : super(
         retry: null,
         name: r'pathFinderProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$pathFinderHash();

  @override
  String toString() {
    return r'pathFinderProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<PathResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PathResponse> create(Ref ref) {
    final argument =
        this.argument as (String, String, {String? time, int? limit});
    return pathFinder(
      ref,
      argument.$1,
      argument.$2,
      time: argument.time,
      limit: argument.limit,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PathFinderProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$pathFinderHash() => r'1d2463ac2ff112ecbe6bd23e2b9f66f9f9de4a62';

final class PathFinderFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<PathResponse>,
          (String, String, {String? time, int? limit})
        > {
  PathFinderFamily._()
    : super(
        retry: null,
        name: r'pathFinderProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PathFinderProvider call(
    String start,
    String end, {
    String? time,
    int? limit,
  }) => PathFinderProvider._(
    argument: (start, end, time: time, limit: limit),
    from: this,
  );

  @override
  String toString() => r'pathFinderProvider';
}

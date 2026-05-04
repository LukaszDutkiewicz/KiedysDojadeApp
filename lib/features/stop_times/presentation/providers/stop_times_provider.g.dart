// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop_times_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(stopTimes)
final stopTimesProvider = StopTimesFamily._();

final class StopTimesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<StopTime>>,
          List<StopTime>,
          FutureOr<List<StopTime>>
        >
    with $FutureModifier<List<StopTime>>, $FutureProvider<List<StopTime>> {
  StopTimesProvider._({
    required StopTimesFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'stopTimesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$stopTimesHash();

  @override
  String toString() {
    return r'stopTimesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<StopTime>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<StopTime>> create(Ref ref) {
    final argument = this.argument as String;
    return stopTimes(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is StopTimesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$stopTimesHash() => r'c8132444aad187cc5c6dd48da4552173cc6bcdea';

final class StopTimesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<StopTime>>, String> {
  StopTimesFamily._()
    : super(
        retry: null,
        name: r'stopTimesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  StopTimesProvider call(String stopCode) =>
      StopTimesProvider._(argument: stopCode, from: this);

  @override
  String toString() => r'stopTimesProvider';
}

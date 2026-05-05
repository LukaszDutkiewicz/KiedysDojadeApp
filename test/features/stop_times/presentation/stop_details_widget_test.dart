import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kiedys_dojade/features/stop_times/domain/entities/stop_time.dart';
import 'package:kiedys_dojade/features/stop_times/presentation/providers/stop_times_provider.dart';
import 'package:kiedys_dojade/features/stop_times/presentation/widgets/stop_details_widget.dart';

// ---------------------------------------------------------------------------
// Fixtures
// ---------------------------------------------------------------------------

const _stopCode = 'STOP001';

StopTime _stopTime({
  String routeId = 'R1',
  String headsign = 'City Center',
  String departure = '10:02:00',
}) =>
    StopTime(
      tripId: 'TRIP1',
      arrivalTime: '10:00:00',
      departureTime: departure,
      stopId: 42,
      stopSequence: 3,
      stopHeadsign: headsign,
      routeId: routeId,
    );

// ---------------------------------------------------------------------------
// Helper — stub is a factory so _wrap never names the Override type directly
// ---------------------------------------------------------------------------

Widget _wrap(FutureOr<List<StopTime>> Function() stub) => ProviderScope(
      overrides: [
        stopTimesProvider(_stopCode).overrideWith((_) => stub()),
      ],
      child: const MaterialApp(
        home: Scaffold(body: StopDetailsWidget(stopCode: _stopCode)),
      ),
    );

void main() {
  group('StopDetailsWidget', () {
    testWidgets('loading state shows CircularProgressIndicator', (tester) async {
      await tester.pumpWidget(
        // Never-completing future keeps the provider in AsyncLoading
        _wrap(() => Completer<List<StopTime>>().future),
      );
      // pump once — pumpAndSettle would hang because the future never resolves
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('empty list shows "Brak odjazdów."', (tester) async {
      await tester.pumpWidget(_wrap(() => Future.value([])));
      await tester.pumpAndSettle();

      expect(find.text('Brak odjazdów.'), findsOneWidget);
    });

    testWidgets('data — renders routeId in CircleAvatar', (tester) async {
      await tester.pumpWidget(
        _wrap(() => Future.value([_stopTime(routeId: 'R7')])),
      );
      await tester.pumpAndSettle();

      expect(find.text('R7'), findsOneWidget);
    });

    testWidgets('data — renders stopHeadsign as list tile title', (tester) async {
      await tester.pumpWidget(
        _wrap(() => Future.value([_stopTime(headsign: 'Północ')])),
      );
      await tester.pumpAndSettle();

      expect(find.text('Północ'), findsOneWidget);
    });

    testWidgets('data — renders departureTime as trailing text', (tester) async {
      await tester.pumpWidget(
        _wrap(() => Future.value([_stopTime(departure: '14:37:00')])),
      );
      await tester.pumpAndSettle();

      expect(find.text('14:37:00'), findsOneWidget);
    });

    testWidgets('data — multiple entries all render', (tester) async {
      final times = [
        _stopTime(routeId: 'R1', headsign: 'North', departure: '08:00:00'),
        _stopTime(routeId: 'R2', headsign: 'South', departure: '09:00:00'),
        _stopTime(routeId: 'R3', headsign: 'East', departure: '10:00:00'),
      ];
      await tester.pumpWidget(_wrap(() => Future.value(times)));
      await tester.pumpAndSettle();

      expect(find.text('R1'), findsOneWidget);
      expect(find.text('R2'), findsOneWidget);
      expect(find.text('R3'), findsOneWidget);
      expect(find.text('North'), findsOneWidget);
      expect(find.text('South'), findsOneWidget);
    });

    testWidgets('error state shows error text', (tester) async {
      await tester.pumpWidget(
        _wrap(() => Future.error(Exception('Network error'))),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('Błąd'), findsOneWidget);
    });
  });
}

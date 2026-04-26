import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:kiedys_dojade/features/navigation/domain/entities/path_item.dart';
import 'package:latlong2/latlong.dart'; // Poprawiony import

class PathMapScreen extends StatelessWidget {
  final PathProposal proposal;

  const PathMapScreen({super.key, required this.proposal});

  // Pomocnicze gettery dla czystszego kodu
  static LatLng _point(PathItem item) => LatLng(item.stop.lat, item.stop.lon);
  static bool _valid(LatLng p) => p.latitude != 0 || p.longitude != 0;

  @override
  Widget build(BuildContext context) {
    // Obliczamy punkty raz
    final points = proposal.map(_point).where(_valid).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trasa przejazdu'),
        elevation: 0,
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCameraFit: points.length > 1
              ? CameraFit.bounds(
                  bounds: LatLngBounds.fromPoints(points),
                  padding: const EdgeInsets.all(60), // Większy padding dla komfortu
                )
              : null,
          initialCenter: points.isNotEmpty ? points.first : const LatLng(52.406, 16.925),
          initialZoom: 13,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.kiedys_dojade.app',
            // Dodaj dark mode jeśli planujesz w przyszłości
          ),
          PolylineLayer(
            polylines: [
              Polyline(
                points: points,
                color: Theme.of(context).primaryColor, // Używaj kolorów z motywu
                strokeWidth: 5,
              ),
            ],
          ),
          MarkerLayer(markers: _buildMarkers(proposal, context)),
        ],
      ),
    );
  }

  List<Marker> _buildMarkers(PathProposal proposal, BuildContext context) {
    return proposal.asMap().entries.map((entry) {
      final i = entry.key;
      final item = entry.value;
      final p = _point(item);
      
      if (!_valid(p)) return null;

      final isFirst = i == 0;
      final isLast = i == proposal.length - 1;
      
      if (isFirst || isLast) {
        return Marker(
          point: p,
          width: 40,
          height: 40,
          alignment: Alignment.topCenter, // KLUCZOWE: nóżka pinezki w punkcie
          child: Icon(
            Icons.location_on,
            color: isFirst ? Colors.green : Colors.red,
            size: 40,
          ),
        );
      }

      // Mniejsze punkty dla przystanków pośrednich
      return Marker(
        point: p,
        width: 12,
        height: 12,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.blue, width: 2),
          ),
        ),
      );
    }).whereType<Marker>().toList();
  }
}
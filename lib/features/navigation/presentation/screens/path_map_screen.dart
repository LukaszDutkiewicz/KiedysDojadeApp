import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:kiedys_dojade/features/navigation/domain/entities/path_item.dart';
import 'package:latlong2/latlong.dart';

class PathMapScreen extends StatelessWidget {
  final PathProposal proposal;

  const PathMapScreen({super.key, required this.proposal});

  static LatLng _point(PathItem item) => LatLng(item.stop.lat, item.stop.lon);

  static bool _valid(LatLng p) => p.latitude != 0 || p.longitude != 0;
  @override
  Widget build(BuildContext context) {
    final points = proposal.map(_point).where(_valid).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Trasa przejazdu')),
      body: FlutterMap(
        options: MapOptions(
          initialCameraFit: points.length > 1
              ? CameraFit.bounds(
                  bounds: LatLngBounds.fromPoints(points),
                  padding: const EdgeInsets.all(48),
                )
              : null,
          initialCenter: points.isNotEmpty ? points.first : const LatLng(52.406, 16.925),
          initialZoom: 13,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.kiedys_dojade',
          ),
          PolylineLayer(
            polylines: [
              Polyline(points: points, color: Colors.blue, strokeWidth: 4),
            ],
          ),
          MarkerLayer(markers: _buildMarkers(proposal)),
        ],
      ),
    );
  }

  static List<Marker> _buildMarkers(PathProposal proposal) {
    final markers = <Marker>[];
    for (var i = 0; i < proposal.length; i++) {
      final item = proposal[i];
      final p = _point(item);
      if (!_valid(p)) continue;
      final isFirst = i == 0;
      final isLast = i == proposal.length - 1;
      final isEndpoint = isFirst || isLast;
      markers.add(Marker(
        point: p,
        width: isEndpoint ? 36 : 16,
        height: isEndpoint ? 36 : 16,
        child: Tooltip(
          message: item.stop.name,
          child: Icon(
            isEndpoint ? Icons.location_pin : Icons.circle,
            color: isFirst ? Colors.green : (isLast ? Colors.red : Colors.blue),
            size: isEndpoint ? 36 : 12,
          ),
        ),
      ));
    }
    return markers;
  }
}

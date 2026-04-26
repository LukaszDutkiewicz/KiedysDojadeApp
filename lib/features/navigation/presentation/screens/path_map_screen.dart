import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kiedys_dojade/features/navigation/domain/entities/path_item.dart';
import 'package:latlong2/latlong.dart';

class PathMapScreen extends StatefulWidget {
  final PathProposal proposal;

  const PathMapScreen({super.key, required this.proposal});

  @override
  State<PathMapScreen> createState() => _PathMapScreenState();
}

class _PathMapScreenState extends State<PathMapScreen> {
  final _mapController = MapController();

  static LatLng _point(PathItem item) => LatLng(item.stop.lat, item.stop.lon);
  static bool _valid(LatLng p) => p.latitude != 0 || p.longitude != 0;

  Future<void> _locateMe() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever ||
        permission == LocationPermission.denied) {
      return;
    }

    final position = await Geolocator.getCurrentPosition();
    if (!mounted) return;
    _mapController.move(LatLng(position.latitude, position.longitude), 16);
  }

  @override
  Widget build(BuildContext context) {
    final points = widget.proposal.map(_point).where(_valid).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trasa przejazdu'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _locateMe,
        tooltip: 'Moja lokalizacja',
        child: const Icon(Icons.my_location),
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCameraFit: points.length > 1
              ? CameraFit.bounds(
                  bounds: LatLngBounds.fromPoints(points),
                  padding: const EdgeInsets.all(60),
                )
              : null,
          initialCenter: points.isNotEmpty ? points.first : const LatLng(52.406, 16.925),
          initialZoom: 13,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.kiedys_dojade.app',
          ),
          PolylineLayer(
            polylines: [
              Polyline(
                points: points,
                color: Theme.of(context).primaryColor,
                strokeWidth: 5,
              ),
            ],
          ),
          MarkerLayer(markers: _buildMarkers(widget.proposal, context)),
          const CurrentLocationLayer(),
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
          alignment: Alignment.topCenter,
          child: Icon(
            Icons.location_on,
            color: isFirst ? Colors.green : Colors.red,
            size: 40,
          ),
        );
      }

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
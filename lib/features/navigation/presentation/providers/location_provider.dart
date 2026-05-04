import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kiedys_dojade/core/permissions/permission_helper.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_provider.g.dart';

class LocationService {
  static Future<LatLng?> getCurrentPosition() async {
    final bool enabled = await Geolocator.isLocationServiceEnabled();
    if (!enabled) return null;
    final pos = await Geolocator.getCurrentPosition();
    return LatLng(pos.latitude, pos.longitude);
  }
}

@Riverpod(keepAlive: true)
class UserLocation extends _$UserLocation {
  @override
  Future<LatLng?> build() async => null;

  Future<void> fetchLocation(BuildContext context) async {
    state = const AsyncLoading();

    final hasPermission = await PermissionHelper.ensure(
      context,
      Permission.locationWhenInUse,
      rationale: 'Lokalizacja jest potrzebna, by pokazać Cię na mapie.',
    );

    if (!ref.mounted) return;

    if (!hasPermission) {
      state = const AsyncData(null);
      return;
    }

    final result = await AsyncValue.guard(LocationService.getCurrentPosition);
    if (ref.mounted) state = result;
  }
}

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NearestLocationFinder {
  final List<Map<String, double>> serviceLocations;
  final LatLng deviceLocation;

  NearestLocationFinder({
    required this.serviceLocations,
    required this.deviceLocation,
  });

  LatLng findNearestLocation() {
    double minDistance = double.infinity;
    LatLng? nearestLocation;

    for (var location in serviceLocations) {
      LatLng serviceLatLng = LatLng(location['latitude']!, location['longitude']!);
      print('bbbbbserviceLatLng $serviceLatLng');
      print('bbbbbdeviceLocation $deviceLocation');
      double distance = Geolocator.distanceBetween(
        deviceLocation.latitude,
        deviceLocation.longitude,
        serviceLatLng.latitude,
        serviceLatLng.longitude,
      );
      if (distance < minDistance) {
        minDistance = distance;
        nearestLocation = serviceLatLng;
      }
    }

    return nearestLocation!;
  }
}

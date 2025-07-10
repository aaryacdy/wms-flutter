import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TravelingSalesmanSolver {
  final List<Map<String, double>> serviceLocations;
  final LatLng deviceLocation;

  TravelingSalesmanSolver({
    required this.serviceLocations,
    required this.deviceLocation,
  });

  double _calculateDistance(LatLng from, LatLng to) {
    return Geolocator.distanceBetween(
      from.latitude,
      from.longitude,
      to.latitude,
      to.longitude,
    );
  }

  List<LatLng> findMostEfficientPath() {
    List<LatLng> locations = serviceLocations
        .map((loc) => LatLng(loc['latitude']!, loc['longitude']!))
        .toList();
    List<LatLng> path = [deviceLocation];
    LatLng currentLocation = deviceLocation;

    while (locations.isNotEmpty) {
      // Find the nearest unvisited location
      LatLng nearest = locations[0];
      double minDistance = _calculateDistance(currentLocation, nearest);

      for (var loc in locations) {
        double distance = _calculateDistance(currentLocation, loc);
        if (distance < minDistance) {
          minDistance = distance;
          nearest = loc;
        }
      }

      // Move to the nearest location
      currentLocation = nearest;
      path.add(currentLocation);
      locations.remove(nearest);
    }

    // Optional: return to the starting point
    // path.add(deviceLocation);

    return path;
  }
}

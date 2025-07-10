import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geocoding;

final deviceAddressProvider = StateProvider<String>((ref) => '');
final locationDataProvider = StateProvider<LatLng>((ref) => const LatLng(0, 0));
final collectorLocationDataProvider =
    StateProvider<LatLng>((ref) => const LatLng(0, 0));

class LocationPermissionHandler {
  final Location location = Location();
  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;

  Future<void> checkLocationPermission() async {
    _serviceEnabled = await location.serviceEnabled();
    print('Location service enabled: $_serviceEnabled');
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      print('Requested location service, now enabled: $_serviceEnabled');
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  Future<void> updateLocation(WidgetRef ref) async {
    if (_permissionGranted == PermissionStatus.granted) {
      LocationData locationData = await location.getLocation();
      final latLongLocation =
          LatLng(locationData.latitude!, locationData.longitude!);
      ref.read(locationDataProvider.notifier).state = latLongLocation;
      ref.read(collectorLocationDataProvider.notifier).state = latLongLocation;
      print('Updated deviceLocationProvider: $latLongLocation');
      print('Location of user: $locationData');
      await reverseGeocode(
          latLongLocation); // Call reverseGeocode after obtaining location
    } else {}
  }

  Future<String> reverseGeocode(LatLng latlng) async {
    try {
      //  final latlng = ref.read(locationDataProvider);
      print('Lat long: ${latlng.toString()}');
      List<geocoding.Placemark> placemarks =
          await geocoding.placemarkFromCoordinates(
        latlng.latitude,
        latlng.longitude,
      );
      print('Placemarks: $placemarks');
      if (placemarks.isNotEmpty) {
        geocoding.Placemark placemark = placemarks[0];
        String address =
            ' ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}';
        print('User address: $address');
        // ref.read(deviceAddressProvider.notifier).state = address;

        return address;
      }
      return '';
    } catch (e) {
      print('Error during reverse geocoding: $e');
      throw Exception('Reverse Geocode error $e');
    }
  }
}

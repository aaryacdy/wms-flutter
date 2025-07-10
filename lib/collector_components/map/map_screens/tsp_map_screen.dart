import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:waste_management_system/user_components/splash_screen/loaction_permission_haldler.dart';

class TspMapScreen extends ConsumerStatefulWidget {
  final List<LatLng> efficientPath;

  const TspMapScreen({super.key, required this.efficientPath});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _TspMapScreenState();
  }
}

class _TspMapScreenState extends ConsumerState<TspMapScreen> {
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();
    _setMarkers();
    _setPolylines();
  }

  void _setMarkers() {
    // Create a marker for each location in the efficientPath
    _markers = widget.efficientPath.asMap().entries.map((entry) {
      int index = entry.key;
      LatLng location = entry.value;

      return Marker(
        markerId: MarkerId('location_$index'),
        position: location,
        infoWindow: InfoWindow(
          title: 'Location $index',
          snippet: 'Lat: ${location.latitude}, Lng: ${location.longitude}',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen), // Change marker color if desired
      );
    }).toSet();
  }

  void _setPolylines() {
    if (widget.efficientPath.isNotEmpty) {
      // Create a polyline connecting all locations in efficientPath
      _polylines.add(Polyline(
        polylineId: PolylineId('efficient_path'),
        color: Colors.blue,
        width: 5,
        points: widget.efficientPath,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceLocation = ref.watch(locationDataProvider);

    // if (deviceLocation == null) {
    //   return Scaffold(
    //     appBar: AppBar(
    //       title: const Text('Google Map'),
    //     ),
    //     body: const Center(
    //       child: Text('Invalid location data'),
    //     ),
    //   );
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map'),
        elevation: 2,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: GoogleMap(
        onTap: (argument) async {
          ref.read(locationDataProvider.notifier).state = argument;
          final address =
              await LocationPermissionHandler().reverseGeocode(argument);
          ref.read(deviceAddressProvider.notifier).state = address;
        },
        markers: _markers,
        polylines: _polylines,
        myLocationEnabled: true,
        initialCameraPosition: CameraPosition(
          target: deviceLocation,
          zoom: 14, // Adjust zoom level as needed
        ),
      ),
    );
  }
}

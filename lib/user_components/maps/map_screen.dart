import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:waste_management_system/user_components/splash_screen/loaction_permission_haldler.dart';

//import 'package:waste_management_system/user_components/splash_screen/splash_screen.dart';

class GoogleMapScreen extends ConsumerStatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _GoogleMapScreenState();
  }
}

class _GoogleMapScreenState extends ConsumerState<GoogleMapScreen> {
  // final Map<String, Marker> _markers = {};
  // Future<void> _onMapCreated(GoogleMapController controller) async {
  //   //final googleOffices = await locations.getGoogleOffices();
  //   setState(() {
  //     _markers.clear();
  //     for (final office in googleOffices.offices) {
  //       final marker = Marker(
  //         markerId: MarkerId(office.name),
  //         position: LatLng(office.lat, office.lng),
  //         infoWindow: InfoWindow(
  //           title: office.name,
  //           snippet: office.address,
  //         ),
  //       );
  //       _markers[office.name] = marker;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final deviceLocation = ref.watch(locationDataProvider);

    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green[700],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Google Map'),
          elevation: 2,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.done))
          ],
        ),
        body: GoogleMap(
          onTap: (argument) async {
            ref.read(locationDataProvider.notifier).state = argument;
            final address =
                await LocationPermissionHandler().reverseGeocode(argument);
            ref.read(deviceAddressProvider.notifier).state = address;
          },
          markers: {
            Marker(
              markerId: const MarkerId('selectedLocation'),
              position: deviceLocation,
            )
          },
          myLocationEnabled: true,
          initialCameraPosition: CameraPosition(
            target: deviceLocation,
            zoom: 10,
          ),
        ),
      ),
    );
  }
}

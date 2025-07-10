import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:waste_management_system/user_components/request_service/model/view_service_model.dart';
import 'package:waste_management_system/user_components/splash_screen/loaction_permission_haldler.dart';

//import 'package:waste_management_system/user_components/splash_screen/splash_screen.dart';

class CollectorMapScreen extends ConsumerStatefulWidget {
  final WastageItem request;
  const CollectorMapScreen({super.key, required this.request});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return CollectorMapScreenState();
  }
}

class CollectorMapScreenState extends ConsumerState<CollectorMapScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceLocation = ref.watch(locationDataProvider);

    final double? latitude = widget.request.latitude != null
        ? double.tryParse(widget.request.latitude!)
        : null;
    final double? longitude = widget.request.longitude != null
        ? double.tryParse(widget.request.longitude!)
        : null;

    // Handle cases where latitude or longitude might be null
    if (latitude == null || longitude == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Google Map'),
        ),
        body: Center(
          child: Text('Invalid location data'),
        ),
      );
    }

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
            // Marker(
            //   markerId: const MarkerId('selectedLocation'),
            //   position: deviceLocation,
            // ),
            Marker(
                markerId: const MarkerId('usersLocation'),
                position: LatLng(latitude, longitude),
                
                
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

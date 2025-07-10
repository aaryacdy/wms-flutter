import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:waste_management_system/collector_components/map/algorithms/spf_impl.dart';
import 'package:waste_management_system/collector_components/services_requested/screen/request_details_screen.dart';
import 'package:waste_management_system/user_components/request_service/model/view_service_model.dart';
import 'package:waste_management_system/user_components/request_service/provider/view_request_service_provider.dart';
import 'package:waste_management_system/user_components/splash_screen/loaction_permission_haldler.dart';

class ViewAllRequestsScreen extends ConsumerStatefulWidget {
  const ViewAllRequestsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ViewAllRequestScreenState();
  }
}

class _ViewAllRequestScreenState extends ConsumerState<ViewAllRequestsScreen> {
  List<Map<String, double>> serviceLocations = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        ref.read(getAllRequestedServices.notifier).getAllRequests();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceLocation = ref.watch(collectorLocationDataProvider);
    print('aaaaa deviceLocation $deviceLocation');
    return Scaffold(
        appBar: AppBar(
          title: const Text('All Requested Services'),
        ),
        body: ref.watch(getAllRequestedServices).maybeWhen(
            orElse: () => const Center(child: Text('No data available')),
            loading: (loading) => const Center(
                  child: CircularProgressIndicator(),
                ),
            error: (e) => const Text('Error fetching data.. '),
            success: (serviceModel, extra) {
              final requests = serviceModel as WastageResponse;

              // Clear the list to avoid duplicates when reloading data
              serviceLocations.clear();

              // Iterate over the list of services and extract latitudes and longitudes
              for (var request in requests.body) {
                serviceLocations.add({
                  'latitude': double.parse(request.latitude!),
                  'longitude': double.parse(request.longitude)
                });
              }
              print('serviceLocations: $serviceLocations');

              // Compute nearest location using NearestLocationFinder
              final nearestLocationFinder = NearestLocationFinder(
                serviceLocations: serviceLocations,
                deviceLocation: deviceLocation,
              );

              final nearestLocation =
                  nearestLocationFinder.findNearestLocation();
              print('Nearest Location: $nearestLocation');

              // print('deviceLocation: $deviceLocation');
              // List<LatLng> shortestPath = tsp.dijkstraAlgorithm();
              // print('shortestPath: $shortestPath');

              //      if (deviceLocation != null) {
              // List<LatLng> serviceLatLng = serviceLocations.map((location) {
              //   return LatLng(location['latitude']!, location['longitude']!);
              // }).toList();
              //      }

              // Create the TSP instance

              return ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                itemCount: requests.body.length,
                itemBuilder: (context, index) {
                  final request = requests.body[index];

                  // Convert the request's latitude and longitude to LatLng
                  final requestLocation = LatLng(
                    double.parse(request.latitude!),
                    double.parse(request.longitude),
                  );

                  // Check if the request location is in the shortest path
                  final isNearest = requestLocation.latitude ==
                          nearestLocation.latitude &&
                      requestLocation.longitude == nearestLocation.longitude;
                  final status = requests.body[index].status;
                  print('status: $status');
                  return
                      //(status != 'Approved')?
                      ListTile(
                    tileColor: isNearest ? Colors.green.withOpacity(0.2) : null,
                    title: Text(requests.body[index].name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Weight: ${requests.body[index].weight.toString()}'),
                        const SizedBox(height: 5),
                        Text(
                            'Descripton: ${requests.body[index].description.toString()}'),
                      ],
                    ),
                    trailing:
                        Text('Price: ${requests.body[index].price.toString()}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RequestDetailsScreen(
                            index: index,
                          ),
                        ),
                      );
                    },
                    // title: Text(requests.body[index].name),
                    // subtitle: Text(requests.body[index].description),
                  );
                  //: null;
                },
              );
            }));
  }
}

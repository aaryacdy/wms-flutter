import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:waste_management_system/collector_components/map/algorithms/tsp_solver.dart';
import 'package:waste_management_system/collector_components/map/map_screens/tsp_map_screen.dart';
import 'package:waste_management_system/user_components/request_service/model/view_service_model.dart';
import 'package:waste_management_system/user_components/request_service/provider/view_request_service_provider.dart';
import 'package:waste_management_system/user_components/splash_screen/loaction_permission_haldler.dart';

final efficientPathProvider = StateProvider<List<LatLng>>((ref) => []);

class ViewApprovedRequestScreen extends ConsumerStatefulWidget {
  const ViewApprovedRequestScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ViewApprovedRequestScreenState();
  }
}

class _ViewApprovedRequestScreenState
    extends ConsumerState<ViewApprovedRequestScreen> {
  List<Map<String, double>> approvedServiceLocations = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        ref
            .read(getApprovedRequests.notifier)
            .getApprovedRequests({'status': 'Approved'});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final path = ref.watch(efficientPathProvider);
    final deviceLocation = ref.watch(collectorLocationDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Approved Requests'),
        actions: [
          IconButton(
            onPressed: () {
              // Compute and set the efficient path using the approvedServiceLocations
              if (approvedServiceLocations.isNotEmpty) {
                Future.microtask(() {
                  // Compute the most efficient path
                  final efficientPath = computeEfficientPath(
                      deviceLocation, approvedServiceLocations);

                  // Update the provider state
                  ref.read(efficientPathProvider.notifier).state =
                      efficientPath;

                  // Navigate to TspMapScreen with the updated path
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TspMapScreen(
                        efficientPath: efficientPath,
                      ),
                    ),
                  );
                });
              } else {
                // Handle the case where there are no approved service locations
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('No approved service locations available.'),
                  ),
                );
              }
            },
            icon: const Icon(Icons.map_outlined),
          ),
        ],
      ),
      body: ref.watch(getApprovedRequests).maybeWhen(
            orElse: () => const Center(
              child: Text('No data available'),
            ),
            loading: (loading) => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (e) => const Text('Error fetching data.. '),
            success: (serviceModel, extra) {
              final requests = serviceModel as WastageResponse;

              // Clear the list to avoid duplicates when reloading data
              approvedServiceLocations.clear();

              // Iterate over the list of services and extract latitudes and longitudes
              for (var request in requests.body) {
                approvedServiceLocations.add({
                  'latitude': double.parse(request.latitude!),
                  'longitude': double.parse(request.longitude)
                });
              }
              print('approvedServiceLocations: $approvedServiceLocations');

              // Compute the most efficient path using the separate method
              // final efficientPath = computeEfficientPath(
              //     deviceLocation, approvedServiceLocations);
              // print('Efficient Path: $efficientPath');

              return ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                itemCount: requests.body.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Title: ${requests.body[index].name}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Weight: ${requests.body[index].weight.toString()}'),
                        const SizedBox(height: 5),
                        Text(requests.body[index].description.toString()),
                      ],
                    ),
                    trailing:
                        Text('Price: ${requests.body[index].price.toString()}'),
                  );
                },
              );
            },
          ),
    );
  }

  List<LatLng> computeEfficientPath(
      LatLng deviceLocation, List<Map<String, double>> serviceLocations) {
    // Instantiate the TSP solver
    final tspSolver = TravelingSalesmanSolver(
      serviceLocations: serviceLocations,
      deviceLocation: deviceLocation,
    );

    // Find the most efficient path
    final efficientPath = tspSolver.findMostEfficientPath();
    // ref.read(efficientPathProvider.notifier).state = efficientPath;
    return efficientPath;
  }
}

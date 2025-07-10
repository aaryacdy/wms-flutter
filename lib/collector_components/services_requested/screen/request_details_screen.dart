import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waste_management_system/collector_components/map/map_screens/collector_map_screen.dart';
import 'package:waste_management_system/local_auth_storage/shared_pref_storage.dart';
import 'package:waste_management_system/user_components/request_service/model/view_service_model.dart';
import 'package:waste_management_system/user_components/request_service/provider/view_request_service_provider.dart';
import 'package:waste_management_system/utils/toast_utils.dart';

class RequestDetailsScreen extends ConsumerStatefulWidget {
  final int index;

  const RequestDetailsScreen({super.key, required this.index});

  @override
  ConsumerState<RequestDetailsScreen> createState() =>
      _RequestDetailsScreenState();
}

class _RequestDetailsScreenState extends ConsumerState<RequestDetailsScreen> {
 // final status = StateProvider<String>((ref) => 'Pending');
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
    ref.listen(approveRequestProvider, (prev, next) {
      next.maybeMap(
        // loading: (value) {
        //   if (value.loading != null) {
        //     ToastUtils().showSuccessToast(message: "Loading...");
        //   } else {
        //     ToastUtils().showSuccessToast(message: "Loading...");
        //   }
        // },
        success: (value) {
          ToastUtils().showSuccessToast(message: "Approved");
        //  ref.read(status.notifier).state = 'approved';
        },
        error: (value) {
          ToastUtils().showErrorToast(message: 'Approval failed');
        },
        orElse: () {},
      );
    });

    ref.listen(rejectRequestProvider, (prev, next) {
      next.maybeMap(
        success: (value) {
          ToastUtils().showSuccessToast(message: "Rejected successfylly");
         // ref.read(status.notifier).state = 'rejected';
        },
        error: (value) {
          ToastUtils().showErrorToast(message: 'Rejection failed');
        },
        orElse: () {},
      );
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request details'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ref.watch(getAllRequestedServices).maybeWhen(
              orElse: () => const Center(child: Text('No data available')),
              loading: (loading) =>
                  const Center(child: CircularProgressIndicator()),
              error: (e) => const Text('Error fetching data.. '),
              success: (serviceModel, extra) {
                final requests = serviceModel as WastageResponse;
                return (Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name: ${requests.body[widget.index].name}',
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Weight: ${requests.body[widget.index].weight}',
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Description: ${requests.body[widget.index].description}',
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Price: ${requests.body[widget.index].price}',
                      ),
                      const SizedBox(height: 8),
                      Text(
                     //   'Approval Status:${ref.read(status)}',
                      'Approval Status: ${requests.body[widget.index].status}',
                      ),
                      Text(
                        'Address: ${requests.body[widget.index].address}',
                      ),
                      // Add other fields as necessary
                      const SizedBox(height: 16),
                      Text(
                        'Latitude: ${requests.body[widget.index].latitude}',
                      ),
                      Text(
                        'Longitude: ${requests.body[widget.index].longitude}',
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return CollectorMapScreen(
                                request: requests.body[widget.index],
                              );
                            }));
                          },
                          child: const Text('View on map')),

                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              _approveRequest(requests.body[widget.index].id);
                            },
                            child: const Text('Approve'),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.red)),
                            onPressed: () {
                              rejectRequest(requests.body[widget.index].id);
                            },
                            child: const Text('Reject'),
                          ),
                        ],
                      )
                    ]));
              })

          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text('Name: ${widget.request.name}',
          //         style: const TextStyle(fontSize: 18)),
          //     const SizedBox(height: 8),
          //     Text('Weight: ${widget.request.weight}',
          //         style: const TextStyle(fontSize: 18)),
          //     const SizedBox(height: 8),
          //     Text('Description: ${widget.request.description}',
          //         style: const TextStyle(fontSize: 18)),
          //     const SizedBox(height: 8),
          //     Text('Price: ${widget.request.price}',
          //         style: const TextStyle(fontSize: 18)),
          //     const SizedBox(height: 8),
          //     Text(
          //       'Approval Status: ${widget.request.status}',
          //     ),
          //     Text('Address: ${widget.request.address}',
          //         style: const TextStyle(fontSize: 18)),
          //     // Add other fields as necessary
          //     const SizedBox(height: 16),
          //     Text('Latitude: ${widget.request.latitude}',
          //         style: const TextStyle(fontSize: 18)),
          //     Text('Longitude: ${widget.request.longitude}',
          //         style: const TextStyle(fontSize: 18)),
          //     ElevatedButton(
          //       onPressed: () {
          //         Navigator.push(context, MaterialPageRoute(builder: (context) {
          //           return CollectorMapScreen(
          //             request: widget.request,
          //           );
          //         }));
          //       },
          //       child: const Text('Navigate on Map'),
          //     ),

          //     const SizedBox(
          //       height: 20,
          //     ),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         ElevatedButton(
          //           onPressed: () {
          //             _approveRequest();
          //           },
          //           child: const Text('Approve'),
          //         ),
          //         ElevatedButton(
          //           style: ButtonStyle(
          //               backgroundColor:
          //                   MaterialStateProperty.all<Color>(Colors.red)),
          //           onPressed: () {
          //             rejectRequest();
          //           },
          //           child: const Text('Reject'),
          //         ),
          //       ],
          //     )
          //   ],
          // ),
          ),
    );
  }

  _approveRequest(int wasteId) async {
    // final id = wasteId.toString();
    final loginInfoJson =
        await SharedPreferenceStorage().read(key: 'login_info');

    try {
      if (loginInfoJson != null) {
        // Parse the JSON string into a Map
        final loginInfo = jsonDecode(loginInfoJson) as Map<String, dynamic>;
        final body = loginInfo['body'] as Map<String, dynamic>;
        final colletctorId = body['id'];
        print('User ID: $colletctorId');
        final params = {'id': wasteId, 'collectorId': colletctorId};
        ref.read(approveRequestProvider.notifier).approveRequest(params);
      } else {
        print('No login info available');
      }
    } catch (e) {
      print('Error parsing login info: $e');
    }
  }

  rejectRequest(int wasteId) async {
    final loginInfoJson =
        await SharedPreferenceStorage().read(key: 'login_info');

    try {
      if (loginInfoJson != null) {
        // Parse the JSON string into a Map
        final loginInfo = jsonDecode(loginInfoJson) as Map<String, dynamic>;
        final body = loginInfo['body'] as Map<String, dynamic>;
        final colletctorId = body['id'];
        print('User ID: $colletctorId');
        final params = {'id': wasteId, 'collectorId': colletctorId};
        ref.read(rejectRequestProvider.notifier).rejectRequest(params);
      } else {
        print('No login info available');
      }
    } catch (e) {
      print('Error parsing login info: $e');
    }
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waste_management_system/local_auth_storage/shared_pref_storage.dart';
import 'package:waste_management_system/user_components/request_service/model/view_service_model.dart';
import 'package:waste_management_system/user_components/request_service/provider/view_request_service_provider.dart';

class ViewRequestsScreen extends ConsumerStatefulWidget {
  const ViewRequestsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ViewRequestScreenState();
  }
}

class _ViewRequestScreenState extends ConsumerState<ViewRequestsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        ref.read(getRequestedServices.notifier).getservices(await getUserId());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Requested Services'),
        ),
        body: ref.watch(getRequestedServices).maybeWhen(
            orElse: () => const Center(child: Text('No data available')),
            loading: (loading) => const Center(
                  child: CircularProgressIndicator(),
                ),
            error: (e) => const Text('Error fetching data.. '),
            success: (serviceModel, extra) {
              final requests = serviceModel as WastageResponse;
              return ListView.builder(
                itemCount: requests.body.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(requests.body[index].name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(requests.body[index].weight.toString()),
                        const SizedBox(height: 5),
                        Text(requests.body[index].description.toString()),
                      ],
                    ),
                    trailing: Text(requests.body[index].price.toString()),
                    // title: Text(requests.body[index].name),
                    // subtitle: Text(requests.body[index].description),
                  );
                },
              );
            }));
  }

  Future<Map<String, dynamic>> getUserId() async {
    final loginInfoJson =
        await SharedPreferenceStorage().read(key: 'login_info');
    try {
      if (loginInfoJson != null) {
        // Parse the JSON string into a Map
        final loginInfo = jsonDecode(loginInfoJson) as Map<String, dynamic>;
        final body = loginInfo['body'] as Map<String, dynamic>;
        //final role = body['role'];
        final userId = body['id'];
        print('User ID: $userId');
        final id = {'userId': userId.toString()};
        return id;
      } else {
        print('No login info available');
        return {};
      }
    } catch (e) {
      print('Error parsing login info: $e');
      throw Exception('Error parsing login info: $e');
    }
  }
}

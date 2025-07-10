import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waste_management_system/api_request.dart';
import 'package:waste_management_system/app_state.dart';
import 'package:waste_management_system/constants/api_constants.dart';
import 'package:waste_management_system/generic_providers/generic_post_provider.dart';
import 'package:waste_management_system/user_components/request_service/model/request_service_model.dart';

// Define the registration provider
final requestServiceProvider = StateNotifierProvider<RequestServiceProviderNotifier,
    AppState<RequestServiceModel>>((ref) {
  return RequestServiceProviderNotifier(ref);
});

class RequestServiceProviderNotifier
    extends StateNotifier<AppState<RequestServiceModel>> {
  final Ref ref;
  RequestServiceProviderNotifier(this.ref) : super(const Initial());

  // Function to register a user
  void requestService(Map<String, dynamic > service) async {
    RequestServiceModel requestServiceModel = RequestServiceModel.fromJson(service);
    try {
      state = const AppState.loading();
     // print(registerModel.username);
      final formData = FormData.fromMap(requestServiceModel.toJson());
      print('formdata: ${formData}');
      final apiRequest = ApiRequest(url: ApiConstants.serviceRequest, data: formData);
      final response = await ref.read(genericPostProvider(apiRequest));
        print('Success with status code: ${response}');
        print(response);
        if (response['success']) {
          state = AppState.success(data: requestServiceModel);
          print(response['message']);
      } else {
        state = const AppState.error();
        print('Failed with status code: ${response.statusCode}');
        print('Request failed with status code: ${response.statusCode}');
        //print('Request method: ${apiRequest.method}');
        print('Request URL: ${apiRequest.url}');
      }
    } catch (e) {
      state = const AppState.error();
      print('Catch Error: $e');

    }
  }
}

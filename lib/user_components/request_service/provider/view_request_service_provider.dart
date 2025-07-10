import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waste_management_system/api_request.dart';
import 'package:waste_management_system/app_state.dart';
import 'package:waste_management_system/constants/api_constants.dart';
import 'package:waste_management_system/generic_providers/generic_get_provider.dart';
import 'package:waste_management_system/user_components/request_service/model/view_service_model.dart';

final getRequestedServices =
    StateNotifierProvider<GetRequestedServices, AppState<WastageResponse>>(
  (ref) => GetRequestedServices(ref: ref),
);

final getAllRequestedServices =
    StateNotifierProvider<GetRequestedServices, AppState<WastageResponse>>(
  (ref) => GetRequestedServices(ref: ref),
);

final getApprovedRequests =
    StateNotifierProvider<GetRequestedServices, AppState<WastageResponse>>(
  (ref) => GetRequestedServices(ref: ref),
);

final approveRequestProvider =
    StateNotifierProvider<GetRequestedServices, AppState<WastageResponse>>(
  (ref) => GetRequestedServices(ref: ref),
);

final rejectRequestProvider =
    StateNotifierProvider<GetRequestedServices, AppState<WastageResponse>>(
  (ref) => GetRequestedServices(ref: ref),
);

class GetRequestedServices extends StateNotifier<AppState<WastageResponse>> {
  Ref ref;
  GetRequestedServices({required this.ref}) : super(const AppState.initial());

  getservices(Map<String, dynamic> userId) async {
    try {
      state = const AppState.loading();
      final apiRequest = ApiRequest(
          url: ApiConstants.viewServiceRequest, queryParameters: userId);
      print(apiRequest.url);

      final response = await ref.read(genericGetProvider(apiRequest));
      print(response);
      final services =
          WastageResponse.fromJson(response as Map<String, dynamic>);
      print('category $services');
      state = AppState.success(data: services);
    } catch (e) {
      print(e);
      state = const AppState.error();
    }
  }

  getAllRequests() async {
    try {
      state = const AppState.loading();
      final apiRequest = ApiRequest(url: ApiConstants.viewAllServiceRequest);
      print(apiRequest.url);

      final response = await ref.read(genericGetProvider(apiRequest));
      print(response);
      final services =
          WastageResponse.fromJson(response as Map<String, dynamic>);
      print('category $services');
      state = AppState.success(data: services);
    } catch (e) {
      print(e);
      state = const AppState.error();
    }
  }

  getApprovedRequests(Map<String, dynamic> params) async {
    try {
      state = const AppState.loading();
      final apiRequest = ApiRequest(
          url: ApiConstants.getApprovedWasteRequest, queryParameters: params);
      print(apiRequest.url);
      final response = await ref.read(genericGetProvider(apiRequest));
      print(response);
      final services =
          WastageResponse.fromJson(response as Map<String, dynamic>);
      print('category $services');
      state = AppState.success(data: services);
    } catch (e) {
      print(e);
      state = const AppState.error();
    }
  }

  approveRequest(Map<String, dynamic> params) async {
    try {
      state = const AppState.loading();
      final apiRequest = ApiRequest(
          url: ApiConstants.approveWasteRequest, queryParameters: params);
      final response = await ref.read(genericGetProvider(apiRequest));
      print(' approve response $response');
      if (response['success']) {
        final services =
            WastageResponse.fromJson(response as Map<String, dynamic>);
        print('category $services');
        state = AppState.success(data: services);
      } else {
        state = AppState.error(data: response['message']);
      }
    } catch (e) {
      print(e);
      state = const AppState.error();
    }
  }

  rejectRequest(Map<String, dynamic> params) async {
    try {
      state = const AppState.loading();
      final apiRequest = ApiRequest(
          url: ApiConstants.rejectWasteRequest, queryParameters: params);
      final response = await ref.read(genericGetProvider(apiRequest));
      print(response);
      final services =
          WastageResponse.fromJson(response as Map<String, dynamic>);
      // print('category $services');
      state = AppState.success(data: services);
    } catch (e) {
      print(e);
      state = const AppState.error();
    }
  }
}

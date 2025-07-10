import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waste_management_system/api_request.dart';
import 'package:waste_management_system/app_state.dart';
import 'package:waste_management_system/local_auth_storage/shared_pref_storage.dart';
import 'package:waste_management_system/login/model/login_response_model.dart';
import 'package:waste_management_system/constants/api_constants.dart';
import 'package:waste_management_system/generic_providers/generic_get_provider.dart';

// Define the registration provider
final loginProvider =
    StateNotifierProvider<LoginProviderNotifier, AppState<LoginResponse>>(
        (ref) {
  return LoginProviderNotifier(ref);
});

final logoutProvider =
    StateNotifierProvider<LoginProviderNotifier, AppState<LoginResponse>>(
        (ref) {
  return LoginProviderNotifier(ref);
});


class LoginProviderNotifier extends StateNotifier<AppState<LoginResponse>> {
  final Ref ref;
  LoginProviderNotifier(this.ref) : super(const Initial());
  // Function to register a user
  void loginUser(Map<String, dynamic> loginUser) async {
    LoginResponse loginModel = LoginResponse.fromJson(loginUser);
    try {
      state = const AppState.loading();
      print('Data send to login api: ${loginUser}');
      print(loginModel.body);
      // final formData = FormData.fromMap(loginModel.toJson());
      // print('formdata: ${formData}');
      final apiRequest =
          ApiRequest(url: ApiConstants.login, queryParameters: loginUser);

      final response = await ref.read(genericGetProvider(apiRequest));
      print(loginModel.toJson());

      print('Success with status code: ${response}');
      print(response);
      if (response['success']) {
        final responseJson = jsonEncode(response);
        state = AppState.success(data: loginModel);
        SharedPreferenceStorage()
            .write(key: 'login_info', value: responseJson);
        SharedPreferenceStorage().write(key: 'login_status', value: 'true');
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

  Future<void> logout() async{
    state = const AppState.loading();
    SharedPreferenceStorage().write(key: 'login_status', value: 'false');
    SharedPreferenceStorage().delete(key: 'login_info');
    state = const AppState.success(data: null);
  }
}

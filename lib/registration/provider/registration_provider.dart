import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waste_management_system/api_request.dart';
import 'package:waste_management_system/app_state.dart';
import 'package:waste_management_system/registration/model/registration_model.dart';
import 'package:waste_management_system/constants/api_constants.dart';
import 'package:waste_management_system/generic_providers/generic_post_provider.dart';

// Define the registration provider
final registrationProvider = StateNotifierProvider<RegistrationProviderNotifier,
    AppState<RegistrationModel>>((ref) {
  return RegistrationProviderNotifier(ref);
});

class RegistrationProviderNotifier
    extends StateNotifier<AppState<RegistrationModel>> {
  final Ref ref;
  RegistrationProviderNotifier(this.ref) : super(const Initial());

  // Function to register a user
  void registerUser(Map<String, dynamic> user) async {
    RegistrationModel registerModel = RegistrationModel.fromJson(user);
    try {
      state = const AppState.loading();
      print(registerModel.username);
      final formData = FormData.fromMap(registerModel.toJson());
      print('formdata: ${formData}');
      final apiRequest = ApiRequest(url: ApiConstants.signUp, data: formData);

      final response = await ref.read(genericPostProvider(apiRequest));
      print(registerModel.toJson());
      // if (response.statusCode == 200) {
      //   final responseBody = response.data;
        print('Success with status code: ${response}');
        print(response);
        if (response['success']) {
          state = AppState.success(data: registerModel);
          print(response['message']);
        // } else {
        //   state = const AppState.error();
        //   print('error: ${responseBody['message']}');
        // }
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

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waste_management_system/api_request.dart';
import 'package:waste_management_system/app_state.dart';
import 'package:waste_management_system/constants/api_constants.dart';
import 'package:waste_management_system/generic_providers/generic_get_provider.dart';
import 'package:waste_management_system/user_components/reset_password/model/reset_password_response_model.dart';

// Define the registration provider
final resetPasswordProvider = StateNotifierProvider<
    ResetPasswordProviderNotifier, AppState<ResetPasswordResponse>>((ref) {
  return ResetPasswordProviderNotifier(ref);
});

class ResetPasswordProviderNotifier
    extends StateNotifier<AppState<ResetPasswordResponse>> {
  final Ref ref;
  ResetPasswordProviderNotifier(this.ref) : super(const Initial());
  // Function to register a user
  void resetPassword(Map<String, dynamic> passwordData) async {
    ResetPasswordResponse resetPasswordResponse =
        ResetPasswordResponse.fromJson(passwordData);
    try {
      state = const AppState.loading();
      print('Data send to login api: ${passwordData}');
      print(resetPasswordResponse.body);
      // final formData = FormData.fromMap(resetPasswordResponse.toJson());
      // print('formdata: ${formData}');
      final apiRequest = ApiRequest(
          url: ApiConstants.resetPassword, queryParameters: passwordData);

      final response = await ref.read(genericGetProvider(apiRequest));
      print('bbbbbb  ${resetPasswordResponse.toJson()}');

      print('Success with status code: ${response}');
      print(response);
      if (response['success']) {
        state = AppState.success(data: resetPasswordResponse);

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

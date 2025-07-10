import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waste_management_system/api_request.dart';
import 'package:waste_management_system/app_state.dart';
import 'package:waste_management_system/user_components/feedback/model/user_feedback_model.dart';
import 'package:waste_management_system/constants/api_constants.dart';
import 'package:waste_management_system/generic_providers/generic_post_provider.dart';

// Define the registration provider
final postUserFeedbackProvider =
    StateNotifierProvider<FeedbackProviderNotifier, AppState<FeedbackModel>>(
        (ref) {
  return FeedbackProviderNotifier(ref);
});

class FeedbackProviderNotifier extends StateNotifier<AppState<FeedbackModel>> {
  final Ref ref;
  FeedbackProviderNotifier(this.ref) : super(const Initial());

  // Function to register a user
  void postUserFeedback(Map<String, dynamic> feedback) async {
    FeedbackModel feedbackModel = FeedbackModel.fromJson(feedback);
    try {
      state = const AppState.loading();

      final formData = FormData.fromMap(feedbackModel.toJson());
      print('formdata: ${formData}');
      final apiRequest =
          ApiRequest(url: ApiConstants.postFeedback, data: formData);

      final response = await ref.read(genericPostProvider(apiRequest));
      print('bbbbbb  ${feedbackModel.toJson()}');

      // print('Success with status code: ${response}');
      print('Response: ${response}');
      if (response['success']) {
        state = AppState.success(data: feedbackModel);
        print(response['message']);
      } else {
        state = const AppState.error();
        print('Failed with status code: ${response}');
        // print('Request failed with status code: ${response.statusCode}');
        print('Request URL: ${apiRequest.url}');
      }
    } catch (e) {
      state = const AppState.error();
      print('Catch Error: $e');
    }
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:waste_management_system/local_auth_storage/shared_pref_storage.dart';
import 'package:waste_management_system/user_components/feedback/provider/user_feedback_provider.dart';
import 'package:waste_management_system/utils/toast_utils.dart';

class FeedbackScreen extends ConsumerStatefulWidget {
  const FeedbackScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _FeedbackScreenState();
  }
}

class _FeedbackScreenState extends ConsumerState<FeedbackScreen> {
  final _feedbackFormKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    ref.listen(postUserFeedbackProvider, (prev, next) {
      next.maybeMap(
        loading: (value) {
          if (value.loading != null) {
            ToastUtils().showSuccessToast(message: "Loading...");
          } else {
            ToastUtils().showSuccessToast(message: "Loading...");
          }
        },
        success: (value) {
          ToastUtils()
              .showSuccessToast(message: "Feedback submitted successfully");
               Navigator.of(context).pop();
        },
        error: (value) {
          ToastUtils().showErrorToast(message: 'error in submitting request');
        },
        orElse: () {},
      );
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Add Feedback'),
      ),
      body: Center(
        child: Container(
          width: 400,
          height: 500,
          child: FormBuilder(
            key: _feedbackFormKey,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Title',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    FormBuilderTextField(
                      name: 'name',
                      decoration: InputDecoration(
                        hintText: 'Enter Title',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      validator: FormBuilderValidators.required(),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Description',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    FormBuilderTextField(
                      name: 'description',
                      decoration: InputDecoration(
                        hintText: 'Enter Description',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      validator: FormBuilderValidators.required(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            fixedSize: const Size(320, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () async {
                          if (_feedbackFormKey.currentState!
                              .saveAndValidate()) {
                            submitForm();
                           
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  void submitForm() async {
    final formValues =
        Map<String, dynamic>.from(_feedbackFormKey.currentState!.value);
    final loginInfoJson =
        await SharedPreferenceStorage().read(key: 'login_info');
    print('login Info $loginInfoJson');
    try {
      if (loginInfoJson != null) {
        // Parse the JSON string into a Map
        final loginInfo = jsonDecode(loginInfoJson) as Map<String, dynamic>;
        final body = loginInfo['body'] as Map<String, dynamic>;
        final id = body['id'];
        print('User ID: $id');

        formValues.addAll({
          'userId': id.toString(),
        });
        print('aaaaaaaa $formValues');
        ref
            .read(postUserFeedbackProvider.notifier)
            .postUserFeedback(formValues);
      } else {
        print('No login info available');
      }
    } catch (e) {
      print('Error parsing login info: $e');
    }
  }
}

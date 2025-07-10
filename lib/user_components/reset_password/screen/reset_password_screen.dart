import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:waste_management_system/constants/regex_constants.dart';
import 'package:waste_management_system/local_auth_storage/shared_pref_storage.dart';
import 'package:waste_management_system/login/screen/login_screen.dart';
import 'package:waste_management_system/user_components/reset_password/provider/reset_password_provider.dart';
import 'package:waste_management_system/utils/toast_utils.dart';

class ResetPasswordScreen extends ConsumerStatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends ConsumerState<ResetPasswordScreen> {
  final _resetPasswordFormKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    ref.listen(resetPasswordProvider, (prev, nxt) {
      nxt.maybeMap(
        loading: (value) {
          if (value.loading != null) {
            ToastUtils().showSuccessToast(message: "Loading...");
          } else {
            ToastUtils().showSuccessToast(message: "Loading...");
          }
        },
        success: (value) {
          ToastUtils().showSuccessToast(message: "Passord reset successful");
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()));
          SharedPreferenceStorage().delete(key: 'login_status');
          SharedPreferenceStorage().delete(key: 'lofin_info');

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
        title: const Text('Reset Password'),
      ),
      body: Center(
        child: Container(
          width: 400,
          height: 500,
          child: FormBuilder(
            key: _resetPasswordFormKey,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Your password',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    FormBuilderTextField(
                      name: 'oldPassword',
                      decoration: InputDecoration(
                        hintText: 'Enter your current password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      obscureText: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(8),
                      ]),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'New Password',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    FormBuilderTextField(
                      name: 'newPassword',
                      decoration: InputDecoration(
                        hintText: 'Enter your new password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(8,
                            errorText:
                                'Password must be atleast 8 charactes long'),
                        FormBuilderValidators.match(
                          RegexConstants.specialCharacterregex,
                          errorText: 'Password must contain special character',
                        ),
                        FormBuilderValidators.match(
                          RegexConstants.upperCaseRegex,
                          errorText: 'Password must contain uppercase',
                        ),
                        FormBuilderValidators.match(
                          RegexConstants.lowerCaseRegex,
                          errorText: 'Password must contain lowercase',
                        ),
                        FormBuilderValidators.match(
                          RegexConstants.numberRegex,
                          errorText: 'Password must contain number',
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Confirm Password',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    FormBuilderTextField(
                      name: 'confirmPassword',
                      decoration: InputDecoration(
                        hintText: 'Confirm your password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'This field is required';
                        }
                        final password = _resetPasswordFormKey
                            .currentState?.fields['newPassword']?.value;
                        if (val != password) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
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
                          if (_resetPasswordFormKey.currentState!
                              .saveAndValidate()) {
                            submitPasswordResetForm();
                          }
                          // final resetPasswordFormData =
                          //     _resetPasswordFormKey.currentState!.value;
                        },
                        child: const Text('Reset'),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  submitPasswordResetForm() async {
    final formValues =
        Map<String, dynamic>.from(_resetPasswordFormKey.currentState!.value);
    final loginInfoJson =
        await SharedPreferenceStorage().read(key: 'login_info');
    print('login Info $loginInfoJson');
    try {
      if (loginInfoJson != null) {
        // Parse the JSON string into a Map
        final loginInfo = jsonDecode(loginInfoJson) as Map<String, dynamic>;
        final body = loginInfo['body'] as Map<String, dynamic>;
        final role = body['role'];
        final userId = body['id'];
        print('User ID: $userId');

        formValues.addAll({
          'role': role,
          'id': userId,
        });
        print('aaaaaaaa $formValues');
        ref.read(resetPasswordProvider.notifier).resetPassword(formValues);
      } else {
        print('No login info available');
      }
    } catch (e) {
      print('Error parsing login info: $e');
    }
  }
}

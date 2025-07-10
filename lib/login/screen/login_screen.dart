import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import 'package:waste_management_system/collector_components/collector_dashboard/screen/collector_dashboard_screen.dart';
import 'package:waste_management_system/local_auth_storage/shared_pref_storage.dart';
import 'package:waste_management_system/login/provider/login_provider.dart';
import 'package:waste_management_system/registration/screen/registration_screen.dart';
import 'package:waste_management_system/user_components/user_dashboard/screen/user_dashboard_screen.dart';
import 'package:waste_management_system/constants/regex_constants.dart';
import 'package:waste_management_system/utils/toast_utils.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});
  @override
  ConsumerState<LoginScreen> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final isPasswordVisible = AutoDisposeStateProvider((ref) => false);

  SimpleFontelicoProgressDialog? dialog;
  final _formKey = GlobalKey<FormBuilderState>();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();

  @override
  void initState() {
    dialog = SimpleFontelicoProgressDialog(context: context);
    SharedPreferenceStorage().read(key: 'login_status').then((value) async {
      if (value == 'true') {
        final loginInfoJson =
            await SharedPreferenceStorage().read(key: 'login_info');
        final loginInfo = jsonDecode(loginInfoJson!) as Map<String, dynamic>;
        final body = loginInfo['body'] as Map<String, dynamic>;
        final role = body['role'];

        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          if (role == 'User') {
            return const UserDashboardScreen();
          } else {
            return const CollectorDashboardScreen();
          }
        }));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(loginProvider, (previous, next) {
      next.maybeMap(
        orElse: () {},
        loading: (value) {
          ToastUtils().showSuccessToast(message: "Loading...");
        },
        success: (value) {
          ToastUtils().showSuccessToast(message: "Login Successsful ");

          Navigator.push(context, MaterialPageRoute(builder: (context) {
            if (_formKey.currentState!.value['role'] == 'User') {
              return const UserDashboardScreen();
            } else if (_formKey.currentState!.value['role'] == 'Collector') {
              return const CollectorDashboardScreen();
            }
            // else if(_formKey.currentState!.value['role'] == 'Admin'){
            //   return const AdminDashboardScreen();
            // }
            return const LoginScreen();
          }));
        },
        error: (value) {
          ToastUtils().showErrorToast(message: 'error in login');
        },
      );
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Login',
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
          child: Container(
        height: 550,
        width: 350,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Welcome',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FormBuilder(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      FormBuilderTextField(
                          name: 'email',
                          focusNode: _emailFocusNode,
                          decoration: const InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'Email',
                            hintText: 'Enter your email address',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email(),
                          ])),
                      const SizedBox(
                        height: 20,
                      ),
                      FormBuilderTextField(
                        name: 'password',
                        obscureText: !ref.watch(isPasswordVisible),
                        focusNode: _passwordFocusNode,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ref.read(isPasswordVisible.notifier).state =
                                  !ref.read(isPasswordVisible.notifier).state;
                            },
                            icon: ref.watch(isPasswordVisible)
                                ? const Icon(Icons.visibility_outlined)
                                : const Icon(Icons.visibility_off_outlined),
                          ),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.minLength(8,
                              errorText:
                                  'Password must be atleast 8 charactes long'),
                          FormBuilderValidators.match(
                            RegexConstants.specialCharacterregex,
                            errorText:
                                'Password must contain special character',
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
                      FormBuilderRadioGroup<String>(
                        name: 'role',
                        validator: FormBuilderValidators.required(),
                        options: const [
                          FormBuilderFieldOption(
                            value: 'User',
                            child: Text('User'),
                          ),
                          FormBuilderFieldOption(
                            value: 'Collector',
                            child: Text('Collector'),
                          ),
                          // FormBuilderFieldOption(
                          //   value: 'Admin',
                          //   child: Text('Admin'),
                          // )
                        ],
                      ),
                    ]),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      fixedSize: const Size(320, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () async {
                    if (_formKey.currentState!.saveAndValidate()) {
                      // ref.read(loginStateProvider.notifier).testProvider;

                      // final roleMap = {'role': 'User'};
                      final loginData = Map<String, dynamic>.from(
                          _formKey.currentState!.value); // Create a mutable map

                      // loginData.addAll(roleMap);
                      print('loginData: $loginData'); // Add additional data
                      ref.read(loginProvider.notifier).loginUser(loginData);
                    }
                  },
                  child: const Text('Login'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'OR',
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(320, 50),
                    backgroundColor: const Color.fromARGB(0, 255, 254, 254),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                  },
                  child: const Text('Sign Up'),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

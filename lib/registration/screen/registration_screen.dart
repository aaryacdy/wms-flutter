import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:waste_management_system/login/screen/login_screen.dart';
import 'package:waste_management_system/registration/provider/registration_provider.dart';
import 'package:waste_management_system/constants/regex_constants.dart';
import 'package:waste_management_system/utils/toast_utils.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SignUpScreenState();
  }
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  // final _loading =
  //     SimpleFontelicoProgressDialog(context: navigatorKey.currentContext!);
  final _signupFormKey = GlobalKey<FormBuilderState>();
  final isPasswordVisible = AutoDisposeStateProvider((ref) => false);

  @override
  Widget build(BuildContext context) {
    ref.listen(registrationProvider, (prev, next) {
      next.maybeMap(
        loading: (value) {
          if (value.loading != null) {
            ToastUtils().showSuccessToast(message: "Loading...");
            // _loading.show(message: '');
          } else {
            // _loading.hide();
            ToastUtils().showSuccessToast(message: "Loading...");
          }
        },
        success: (value) {
          ToastUtils().showSuccessToast(message: "Registered Successfully");
          Navigator.of(context).pop();
        },
        error: (value) {
          ToastUtils().showErrorToast(message: 'error in signup');
        },
        orElse: () {},
      );
    });
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('SignUp'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 350,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  FormBuilder(
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: _signupFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Welcome',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FormBuilderTextField(
                          name: 'name',
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'Full Name',
                            hintText: 'Enter your full name',
                            prefixIcon: Icon(Icons.person_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                          ),
                          validator: FormBuilderValidators.required(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FormBuilderTextField(
                          name: 'email',
                          decoration: const InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'Email',
                            hintText: 'Enter your email',
                            prefixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email(),
                            FormBuilderValidators.match(
                                RegexConstants.emailRegex),
                          ]),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FormBuilderTextField(
                          name: 'address',
                          decoration: const InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'Address',
                            prefixIcon: Icon(Icons.location_on_outlined),
                            hintText: 'Enter your address',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FormBuilderTextField(
                          name: 'mobileNo',
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'Mobile Number',
                            hintText: 'Enter your mobile number',
                            prefixIcon: Icon(Icons.phone_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.numeric(),
                            FormBuilderValidators.match(
                                RegexConstants.nepaliMobileNumberRegex),
                            FormBuilderValidators.minLength(10),
                            FormBuilderValidators.maxLength(10),
                          ]),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FormBuilderTextField(
                          name: 'username',
                          decoration: const InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'Username',
                            hintText: 'Enter your username',
                            prefixIcon: Icon(Icons.person_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                          ),
                          validator: FormBuilderValidators.required(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FormBuilderTextField(
                          name: 'password',
                          obscureText: !ref.watch(isPasswordVisible),
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              onPressed: () {
                                ref.read(isPasswordVisible.notifier).state =
                                    !ref.read(isPasswordVisible.notifier).state;
                              },
                              icon: ref.watch(isPasswordVisible)
                                  ? const Icon(Icons.visibility_outlined)
                                  : const Icon(Icons.visibility_off_outlined),
                            ),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
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
                          height: 10,
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
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
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
                      onPressed: () {
                        if (_signupFormKey.currentState!.saveAndValidate()) {
                          FocusManager.instance.primaryFocus?.unfocus();

                          ref
                              .read(registrationProvider.notifier)
                              .registerUser(_signupFormKey.currentState!.value);
                        }
                      },
                      child: const Text('Sign Up'),
                    ),
                  ),
                  Row(
                    children: [
                      const Text('Already signed up?'),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

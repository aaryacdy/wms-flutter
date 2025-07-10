import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:waste_management_system/local_auth_storage/shared_pref_storage.dart';
import 'package:waste_management_system/user_components/category/model/waste_category_model.dart';
import 'package:waste_management_system/user_components/category/provider/get_category_provider.dart';
import 'package:waste_management_system/user_components/maps/map_screen.dart';
import 'package:waste_management_system/user_components/request_service/provider/request_service_provider.dart';
import 'package:waste_management_system/user_components/splash_screen/loaction_permission_haldler.dart';
import 'package:waste_management_system/utils/toast_utils.dart';

class RequestService extends ConsumerStatefulWidget {
  const RequestService({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _RequestService();
  }
}

class _RequestService extends ConsumerState<RequestService> {
  final _formKey = GlobalKey<FormBuilderState>();
  final totalPriceController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(getAllCategoryProvider.notifier).getAllCategory();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categoriesState = ref.watch(getAllCategoryProvider);

    final deviceAddress = ref.watch(deviceAddressProvider);

    addressController.text = deviceAddress;

    ref.listen(requestServiceProvider, (prev, next) {
      next.maybeMap(
        loading: (value) {
          if (value.loading != null) {
            ToastUtils().showSuccessToast(message: "Loading...");
          } else {
            ToastUtils().showSuccessToast(message: "Loading...");
          }
        },
        success: (value) {
          ToastUtils().showSuccessToast(message: "Request successfully");
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
          title: const Text('Request Service'),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Request Services',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              FormBuilder(
                key: _formKey,
                child: Center(
                  child: Container(
                    width: 400,
                    height: 700,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          _fomBuilder('name', 'Heading', [
                            FormBuilderValidators.required(
                                errorText: 'Heading is required'),
                          ]),
                          const SizedBox(
                            height: 20,
                          ),
                          categoriesState.maybeWhen(
                            orElse: () {
                              return const SizedBox();
                            },
                            success: (categoryModel, extra) {
                              final categories = categoryModel as CategoryModel;
                              return FormBuilderDropdown<String>(
                                onChanged: (value) {
                                  _updatePrice();
                                },
                                name: 'categoryId',
                                items: categories.body
                                    .map((category) => DropdownMenuItem<String>(
                                          value: category.id.toString(),
                                          child: Text(category.name),
                                        ))
                                    .toList(),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          _fomBuilder('weight', 'Weight', [
                            FormBuilderValidators.required(),
                          ]),
                          const SizedBox(
                            height: 20,
                          ),
                          FormBuilderTextField(
                            name: 'address',
                            controller: addressController,
                            readOnly: true,
                            decoration: const InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              label: Text('Address'),
                              hintText: 'Address',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              )),
                            ),
                            onTap: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const GoogleMapScreen()));
                            },
                            validator: FormBuilderValidators.compose([]),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          _fomBuilder('description', 'Description', [
                            FormBuilderValidators.required(),
                          ]),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: categoriesState.maybeWhen(
                              orElse: () {
                                return const SizedBox();
                              },
                              success: (categoryModel, extra) {
                                return FormBuilderTextField(
                                  name: 'price',
                                  controller: totalPriceController,
                                  readOnly: true,
                                  decoration: const InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    label: Text('Total price'),
                                    hintText: 'Price',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    )),
                                  ),
                                  validator: FormBuilderValidators.compose([]),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text('Total Price: $deviceAddress'),
                          Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(320, 50),
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                              ),
                              onPressed: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignUpScreen()));
                                if (_formKey.currentState!.saveAndValidate()) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  submitForm();
                                }
                              },
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _fomBuilder(String name, String hintText,
      List<FormFieldValidator<dynamic>> validators) {
    return FormBuilderTextField(
      name: name,
      onChanged: (value) => _updatePrice(),
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: Text(hintText),
        hintText: hintText,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(30),
        )),
      ),
      validator: FormBuilderValidators.compose(validators),
    );
  }

  void _updatePrice() {
    // print('hrkk');
    _formKey.currentState?.save();
    // print('hrkk1');
    final categoryId = _formKey.currentState?.fields['categoryId']?.value;
   // print('hrkk4 $categoryId');
    final weightValue =
        double.tryParse(_formKey.currentState?.fields['weight']?.value ?? '');
    //print('hrkk5 $weightValue');
    if (categoryId != null && weightValue != null) {
     // print('hrkk6');
      final categoriesState = ref.read(getAllCategoryProvider);
      categoriesState.maybeWhen(
        success: (categoryModel, extra) {
          final category = categoryModel!.body.firstWhere(
            (cat) => cat.id.toString() == categoryId,
            orElse: () => throw Exception('Category not found: $categoryId'),
          );

          final price = category.price * weightValue;
          print('pppp ${category.price}');
          totalPriceController.text = (price * 1.0).toString();
        },
        orElse: () {},
      );
    }
  }

  void submitForm() async {
    final formValues = Map<String, dynamic>.from(_formKey.currentState!.value);
    final requestLocation = ref.read(locationDataProvider);
    final lat = requestLocation.latitude.toString();
    //print('lat $lat');
    final lng = requestLocation.longitude.toString();
    // print('lng $lng');
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
          'latitude': lat,
          'longitude': lng,
          'userId': id.toString(),
        });
        print('aaaaaaaa $formValues');
        ref.read(requestServiceProvider.notifier).requestService(formValues);
      } else {
        print('No login info available');
      }
    } catch (e) {
      print('Error parsing login info: $e');
    }
  }
}

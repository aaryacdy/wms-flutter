import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waste_management_system/user_components/add_category/provider/add_category_provider.dart';
import 'package:waste_management_system/utils/toast_utils.dart';

class AddCategory extends ConsumerStatefulWidget {
  const AddCategory({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddCategoryState();
}

class _AddCategoryState extends ConsumerState<AddCategory> {
  final _formKey = GlobalKey<FormBuilderState>();
  final picker = ImagePicker();
  final selectedImage = StateProvider<XFile?>((ref) => null);
  XFile? _selectedImage;

  @override
  Widget build(BuildContext context) {
    ref.listen(addCategoryProvider, (prev, next) {
      next.maybeMap(
        orElse: () {},
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
      );
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Add Category'),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.8,
          width: MediaQuery.sizeOf(context).width * 0.9,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(children: [
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Add Category',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            // Text('Add Category',
            //     style: Theme.of(context).textTheme.headlineMedium),
            Padding(
              padding: const EdgeInsets.all(16),
              child: FormBuilder(
                key: _formKey,
                child: Column(children: [
                  FormBuilderTextField(
                    name: 'categoryName',
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Category Name',
                      hintText: 'Enter Category Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                    ),
                    validator: FormBuilderValidators.required(),
                  ),
                  const SizedBox(height: 20),
                  FormBuilderTextField(
                    name: 'price',
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Category Price',
                      hintText: 'Enter the price for this category',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'Category name should not be empty'),
                      FormBuilderValidators.numeric(
                          errorText: 'Enter valid price')
                    ]),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(
                    height: 20,
                  ),
                  FormBuilderTextField(
                    name: 'description',
                    maxLines: 6,
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Description',
                      hintText: 'Enter description for this category',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                    ),
                    validator: FormBuilderValidators.required(),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    height: 100,
                    child: addImageWidget(),
                  )
                ]),
              ),
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
                    _submitForm();
                    // ref.read(loginStateProvider.notifier).testProvider;
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             const UserDashboardScreen()));
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget addImageWidget() {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Select Image From'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: const Text('Camera'),
                      onTap: () async {
                        XFile? image = await getImagesFromCamera();
                        ref.read(selectedImage.notifier).state = image;
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      title: const Text('Gallery'),
                      onTap: () async {
                        XFile? image = await getImagesFromGallery();
                        ref.read(selectedImage.notifier).state = image;
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              );
            });
      },
    );
  }

  Future<XFile> getImagesFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    return pickedFile!;
  }

  Future<XFile> getImagesFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    return pickedFile!;
  }

  void _submitForm() async {
    final formValues = _formKey.currentState!.value;
    if (ref.read(selectedImage) == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an image')),
      );
      return;
    }
    // Prepare multipart data
    // String fileName = _selectedImage!.path.split('/').last;
    final attachmentMap = {
      'iconPic': await MultipartFile.fromFile(
        _selectedImage!.path,
      ),
    };
    formValues.addAll(attachmentMap);
    ref.read(addCategoryProvider.notifier).addCategory(formValues);
  }
}

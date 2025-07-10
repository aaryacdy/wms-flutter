import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waste_management_system/user_components/category/model/waste_category_model.dart';
import 'package:waste_management_system/user_components/category/provider/get_category_provider.dart';

class ViewCategory extends ConsumerStatefulWidget {
  const ViewCategory({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ViewCategoryState();
  }
}

class _ViewCategoryState extends ConsumerState<ViewCategory> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(getAllCategoryProvider.notifier).getAllCategory();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('All  Category'),
        ),
        body: ref.watch(getAllCategoryProvider).maybeWhen(
            orElse: () => const Center(child: Text('No category available')),
            loading: (loading) => const Center(
                  child: CircularProgressIndicator(),
                ),
            error: (e) => const Text('Error fetching categories.. '),
            success: (categoryModel, extra) {
              final categories = categoryModel as CategoryModel;
              return ListView.builder(
                itemCount: categories.body.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(categories.body[index].name),
                    subtitle: Text(categories.body[index].description),
                    trailing: Text(categories.body[index].price.toString()),
                  );
                },
              );
            }));
  }
}

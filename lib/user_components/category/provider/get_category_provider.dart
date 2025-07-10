import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waste_management_system/api_request.dart';
import 'package:waste_management_system/app_state.dart';
import 'package:waste_management_system/user_components/category/model/waste_category_model.dart';
import 'package:waste_management_system/constants/api_constants.dart';
import 'package:waste_management_system/generic_providers/generic_get_provider.dart';


final getAllCategoryProvider =
    StateNotifierProvider<GetCategoryProvider, AppState<CategoryModel>>(
  (ref) => GetCategoryProvider(ref: ref),
);

class GetCategoryProvider extends StateNotifier<AppState<CategoryModel>> {
  Ref ref;
  GetCategoryProvider({required this.ref}) : super(const AppState.initial());

  getAllCategory() async {
    try {
      state = const AppState.loading();
      final apiRequest = ApiRequest(url: ApiConstants.getAllCategory);
      print(apiRequest.url);

      final response = await ref.read(genericGetProvider(apiRequest));
      print(response);
      final category = CategoryModel.fromJson(response as Map<String, dynamic>);
      print('category $category');
      state = AppState.success(data: category);
    } catch (e) {
      print(e);
      state = const AppState.error();
    }
  }
}

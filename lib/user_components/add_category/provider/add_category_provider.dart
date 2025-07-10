import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waste_management_system/api_request.dart';
import 'package:waste_management_system/app_state.dart';
import 'package:waste_management_system/user_components/category/model/waste_category_model.dart';
import 'package:waste_management_system/constants/api_constants.dart';
import 'package:waste_management_system/generic_providers/generic_post_provider.dart';


final addCategoryProvider = StateNotifierProvider<AddCategoryProvider,
    AppState<CategoryModel>>((ref) {
  return AddCategoryProvider(ref: ref);
});

class AddCategoryProvider extends StateNotifier<AppState<CategoryModel>>{
  Ref ref;

  AddCategoryProvider({required this.ref}) : super(const AppState.initial());
  addCategory(Map<String, dynamic> category) async{
    CategoryModel categoryModel = CategoryModel.fromJson(category);
    try{
      state = const AppState.loading();
      final formData = FormData.fromMap(categoryModel.toJson());
      final apiRequest = ApiRequest(url: ApiConstants.saveCategory, data: formData);
      final response =await ref.read(genericPostProvider(apiRequest));
      if(response.statusCode == 200){
        final responseBody = response.data;
        if(responseBody['success']){
          state = AppState.success(data: categoryModel);
        }
        else{
          state = const AppState.error();
        }
      }
    }
    catch(e){
      state = const AppState.error();
    }
  }
}
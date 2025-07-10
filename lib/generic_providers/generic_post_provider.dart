import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waste_management_system/api_request.dart';
import 'package:waste_management_system/generic_providers/dio_provider.dart';



final genericPostProvider = Provider.family.autoDispose<dynamic, ApiRequest>((ref, apiRequest){
  return GenericPostToApi(apiRequest, ref).postGeneric();
});

class GenericPostToApi {
  ApiRequest apiRequest;
  AutoDisposeProviderRef ref;

  GenericPostToApi(this.apiRequest, this.ref);

  postGeneric() async {
    try {
      final response = await ref
          .read(dioProvider)
          .post(apiRequest.url, data: apiRequest.data);
          if(response.statusCode == 200){
            return response.data;
          }
          else{
            throw Exception(response.data['message']);
          }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

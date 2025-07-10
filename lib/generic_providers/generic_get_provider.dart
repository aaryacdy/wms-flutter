import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waste_management_system/api_request.dart';
import 'package:waste_management_system/generic_providers/dio_provider.dart';

final genericGetProvider =
    Provider.family.autoDispose<dynamic, ApiRequest>((ref, apiRequest) {
  return GenericGetFromApi(apiRequest, ref).getGeneric();
});

class GenericGetFromApi {
  ApiRequest apiRequest;
  AutoDisposeProviderRef ref;

  GenericGetFromApi(this.apiRequest, this.ref);

  getGeneric() async {
    try {
      final response = await ref
          .read(dioProvider)
          .get(apiRequest.url, queryParameters: apiRequest.queryParameters);
      if (response.statusCode == 200) {
       
        print('response: ${response.data}');
        return response.data;
      } else {
        print(':${response.data['message']}');
        throw Exception(response.data['message']);
      }
    } catch (e) {
      print('error');
      throw Exception(e.toString());
    }
  }
}

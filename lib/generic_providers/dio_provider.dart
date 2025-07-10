import 'package:dio/dio.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waste_management_system/constants/api_constants.dart';


final dioProvider = Provider<Dio>((ref)=>getDio());
getDio(){
  return Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
    ),
  );
}
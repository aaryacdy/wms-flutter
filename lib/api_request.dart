
import 'package:dio/dio.dart';

class ApiRequest{
  String url;
  FormData? data;
  Map<String, dynamic>? queryParameters;
  ApiRequest({required this.url, this.data, this.queryParameters});
}
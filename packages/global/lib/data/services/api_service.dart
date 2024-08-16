import 'package:dio/dio.dart';

import 'api_base_services.dart';

class ApiModel extends ApiBaseModel {
  static final ApiModel instance = ApiModel._();
  factory ApiModel() => instance;
  ApiModel._() {
    dio = Dio();
    dio.interceptors.add(DioTokenInterceptor());
  }
}




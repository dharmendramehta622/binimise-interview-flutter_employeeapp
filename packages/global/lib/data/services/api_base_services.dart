import '../../global.dart';
import 'logger_service.dart';
import 'dart:convert';

class ApiResponse {
  bool status = false;
  Response? msg;

  ApiResponse({required this.status, this.msg});

  @override
  String toString() => 'Status: $status, Msg: $msg';
}

abstract class ApiBaseModel {
  late Dio dio;

  _errorLogger(Map<String, dynamic>? variables, DioError? error) {
    String errorString = '''
    Variables: $variables
    Error: ${error!.error}
    Error Message: ${error.message}
    Status Code: ${error.response?.statusCode}
    Status Message: ${error.response?.statusMessage}
    ''';
    LoggerService.instance.errorLogger(errorString);
  }

  _successLogger(Map<String, dynamic>? variables, Response? response) {
    String errorString = '''
    Variables: $variables
    Status Code: ${response!.statusCode}
    Status Message: ${response.statusMessage}
    Response Data: ${response.data}
    ''';
    LoggerService.instance.infoLogger(errorString);
  }

  Future<ApiResponse> get(
      {required String url, Map<String, dynamic>? variables}) async {
    try {
      final Response response =
          await dio.get('${ApiConstant.httpBase + ApiConstant.apiBaseUrl}$url');
      _successLogger(
        variables,
        response,
      );
      return ApiResponse(status: true, msg: response);
    } on DioError catch (error) {
      _errorLogger(
        variables,
        error,
      );
      return ApiResponse(status: false, msg: error.response);
    }
  }

  Future<ApiResponse> post(
      {required String url,
      FormData? formData,
      required Map<String, dynamic> variables}) async {
    try {
      // print(formData.);
      final Response response = await dio.post(
          '${ApiConstant.httpBase + ApiConstant.apiBaseUrl}$url',
          data: formData ?? json.encode(variables));
      _successLogger(
        variables,
        response,
      );
      return ApiResponse(status: true, msg: response);
    } on DioError catch (error) {
      _errorLogger(
        variables,
        error,
      );
      return ApiResponse(status: false, msg: error.response);
    }
  }

  Future<ApiResponse> patch(
      {required String url,
      FormData? formData,
      Map<String, dynamic>? variables}) async {
    try {
      final Response response = await dio.patch(
        '${ApiConstant.httpBase + ApiConstant.apiBaseUrl}$url',
        data: formData ?? json.encode(variables),
      );
      _successLogger(
        variables,
        response,
      );
      return ApiResponse(status: true, msg: response);
    } on DioError catch (error) {
      _errorLogger(
        variables,
        error,
      );
      return ApiResponse(status: false, msg: error.response);
    }
  }

  Future<ApiResponse> put(
      {required String url,
      FormData? formData,
      required Map<String, dynamic> variables}) async {
    try {
      final Response response = await dio.put(
        '${ApiConstant.httpBase + ApiConstant.apiBaseUrl}$url',
        data: formData ?? json.encode(variables),
      );
      _successLogger(
        variables,
        response,
      );
      return ApiResponse(status: true, msg: response);
    } on DioError catch (error) {
      _errorLogger(
        variables,
        error,
      );
      return ApiResponse(status: false, msg: error.response);
    }
  }

  Future<ApiResponse> delete(
      {required String url, Map<String, dynamic>? variables}) async {
    try {
      final Response response = await dio.delete(
        '${ApiConstant.httpBase + ApiConstant.apiBaseUrl}$url',
        data: json.encode(variables),
      );
      _successLogger(
        variables,
        response,
      );
      return ApiResponse(status: true, msg: response);
    } on DioError catch (error) {
      _errorLogger(
        variables,
        error,
      );
      return ApiResponse(status: false, msg: error.response);
    }
  }
}

abstract class ApiAuthenticationBaseModel {
  late Dio dio;

  _errorLogger(Map<String, dynamic>? variables, DioError? error) {
    String errorString = '''
    Variables: $variables
    Error: ${error!.error}
    Error Message: ${error.message}
    Status Code: ${error.response?.statusCode}
    Status Message: ${error.response?.statusMessage}
    ''';
    LoggerService.instance.errorLogger(errorString);
  }

  _successLogger(Map<String, dynamic>? variables, Response? response) {
    String errorString = '''
    Variables: $variables
    Status Code: ${response!.statusCode}
    Status Message: ${response.statusMessage}
    Response Data: ${response.data}
    ''';
    LoggerService.instance.infoLogger(errorString);
  }

  Future<ApiResponse> get(
      {required String url,
      FormData? formData,
      required Map<String, dynamic> variables}) async {
    try {
      final Response response = await dio.get(url);
      _successLogger(
        variables,
        response,
      );
      return ApiResponse(status: true, msg: response);
    } on DioError catch (error) {
      _errorLogger(
        variables,
        error,
      );
      return ApiResponse(status: false, msg: error.response);
    }
  }

  Future<ApiResponse> post(
      {required String url,
      FormData? formData,
      required Map<String, dynamic> variables}) async {
    try {
      final Response response = await dio.post(
          '${ApiConstant.httpBase + ApiConstant.apiBaseUrl}$url',
          data: formData ?? json.encode(variables));
      _successLogger(
        variables,
        response,
      );
      return ApiResponse(status: true, msg: response);
    } on DioError catch (error) {
      _errorLogger(
        variables,
        error,
      );
      return ApiResponse(status: false, msg: error.response);
    }
  }
}

class DioTokenInterceptor extends Interceptor {
  _infoLogger(RequestOptions options) {
    LoggerService.instance.infoLogger('''
    URL: ${options.path}
    METHOD: ${options.method}
    VALIDATE STATUS: ${options.validateStatus}

    Headers: ${options.headers}
    Follow Redirects: ${options.followRedirects}
    Extra: ${options.extra}
    List Format: ${options.listFormat}

    Query Parameters: ${options.queryParameters}
    ''');
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll(await _getHeaders());
    _infoLogger(options);
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError error, ErrorInterceptorHandler handler) {
    return super.onError(error, handler);
  }
}

class CommonAuthInterceptor extends Interceptor {
  _infoLogger(RequestOptions options) {
    LoggerService.instance.infoLogger('''
    URL: ${options.path}
    METHOD: ${options.method}
    VALIDATE STATUS: ${options.validateStatus}

    Headers: ${options.headers}
    Follow Redirects: ${options.followRedirects}
    Extra: ${options.extra}
    List Format: ${options.listFormat}

    Query Parameters: ${options.queryParameters}
    ''');
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll(await _getCommonHeaders());
    _infoLogger(options);
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError error, ErrorInterceptorHandler handler) {
    return super.onError(error, handler);
  }
}

Future<Map<String, String>> _getHeaders() async {
  final sessionInfo = await _tryGetSessionDetails();
  final sessionData = SessionInfo.fromMap(sessionInfo);
  final token = sessionData.access;

  Map<String, String> headers = {
    'Accept': 'application/json',
    "Content-Type": "application/json",
    "Connection": "keep-alive",
  };

  if (token != null) {
    headers['Authorization'] = 'Bearer $token';
  }

  return headers;
}

Future<Map<String, String>> _getCommonHeaders() async {
  // final sessionInfo = await _tryGetSessionDetails();
  // final sessionData = SessionInfo.fromMap(sessionInfo);
  // final _token = sessionData.access;

  Map<String, String> headers = {
    'Accept': 'application/json',
    "Content-Type": "application/json",
    "Connection": "keep-alive",
  };

  return headers;
}

Future<Map<dynamic, dynamic>?> _tryGetSessionDetails() async {
  try {
    final data = {"asdf": "df"};
    // final data = await UserInfoStorageService().getSessionDetails();
    return data;
  } catch (_) {
    return null;
  }
}

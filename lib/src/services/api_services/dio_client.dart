import 'package:dio/dio.dart';
import '../../shared/constants/api_constants.dart';
import 'request_interceptor.dart';

class DioClient {
  final Dio _dio = Dio();
  final String baseUrl = ApiConst.baseUrl;
  final RequestInterceptor requestInterceptor = RequestInterceptor();

  DioClient();

  Map<String, dynamic> headers = {
    'AuthorizationToken': '<use your auth token here>',
    "Accept": "application/json",
  };

  BaseOptions _dioOptions() {
    final BaseOptions opts = BaseOptions()
      ..baseUrl = baseUrl
      ..headers = headers
      ..connectTimeout = const Duration(minutes: 1)
      ..receiveTimeout = const Duration(minutes: 1)
      ..sendTimeout = const Duration(minutes: 1);
    return opts;
  }

  Dio provideDio() {
    _dio.options = _dioOptions();
    _dio.interceptors.add(requestInterceptor);
    return _dio;
  }
}

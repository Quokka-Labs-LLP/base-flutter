import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RequestInterceptor extends Interceptor {
  @override
  void onError(final DioException err, final ErrorInterceptorHandler handler) {
    debugPrint("=== Dio Error !!!! ====>>>> ${err.type}");
    return super.onError(err, handler);
  }

  @override
  Future<void> onRequest(
    final RequestOptions options,
    final RequestInterceptorHandler handler,
  ) async {
    debugPrint("=== Dio Request ====>>>> ${options.method} => ${options.uri}");
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(
      final Response response, final ResponseInterceptorHandler handler,) {
    debugPrint("=== Dio Success Response ====>>>> ${response.data}");
    return super.onResponse(response, handler);
  }
}

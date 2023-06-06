import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



class RequestInterceptor extends Interceptor{
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint("=== Dio Error !!!! ====>>>> ${err.type}");
    return super.onError(err, handler);
  }


  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint("=== Dio Request ====>>>> ${options.method} => ${options.uri}");
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint("=== Dio Success Response ====>>>> ${response.data}");
    return super.onResponse(response, handler);

  }

}
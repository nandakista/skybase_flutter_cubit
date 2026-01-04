/* Created by
   Varcant
   nanda.kista@gmail.com
*/

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

final class ApiLogInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('');
      debugPrint('# ⏳REQUEST');
      debugPrint('--> ${options.method.toUpperCase()} - ${options.uri}');
      debugPrint('Headers: ${options.headers}');
      debugPrint('Query Params: ${options.queryParameters}');
      debugPrint('Body: ${options.data}');
      if (options.data is FormData) {
        debugPrint('Body: ${(options.data as FormData).fields}');
      }
      debugPrint('--> END ${options.method.toUpperCase()}');
    }
    return super.onRequest(options, handler);
  }

  @override
  Future<dynamic> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    if (kDebugMode) {
      debugPrint('');
      debugPrint('# ✅RESPONSE');
      debugPrint('<-- ${(response.requestOptions.uri)}');
      debugPrint('Status Code : ${response.statusCode} ');
      debugPrint('Headers: ${response.headers}');
      debugPrint('Response: ${response.data}');
      debugPrint('<-- END HTTP');
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('');
      debugPrint('# ❌ERROR');
      debugPrint('<-- ${err.response?.requestOptions.baseUrl}');
      debugPrint('Status Code : ${err.response?.statusCode} ');
      debugPrint('Error Message : ${err.error} ');
      debugPrint('Error Message : ${err.message} ');
      debugPrint('Error Response Message : ${err.response?.statusMessage} ');
      debugPrint('Response Path : ${err.response?.requestOptions.uri}');
      debugPrint('<-- End HTTP');
    }
    return super.onError(err, handler);
  }
}

/* Created by
   Varcant
   nanda.kista@gmail.com
*/

import 'package:dio/dio.dart';
import 'package:skybase/config/network/api_token_manager.dart';

final class ApiTokenInterceptors extends ApiTokenManager
    implements QueuedInterceptorsWrapper {
  ApiTokenInterceptors(this._dio);
  final Dio _dio;

  @override
  Future<dynamic> onRequest(options, handler) async {
    return handler.next(options);
  }

  @override
  Future<dynamic> onResponse(Response response, handler) async {
    return super.onResponse(response, handler);
  }

  @override
  Future<dynamic> onError(DioException err, handler) async {
    handleToken(dio: _dio, err: err, handler: handler);
  }
}

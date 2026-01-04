import 'package:dio/dio.dart';
import 'package:skybase/config/environment/app_env.dart';
import 'package:skybase/config/network/interceptors/api_log_interceptor.dart';
import 'package:skybase/config/network/interceptors/api_token_interceptor.dart';
import 'package:skybase/service_locator.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
class DioClient {
  static String baseURL = AppEnv.config.baseUrl;
  final Dio _dio = sl<Dio>();

  static Dio get instance => sl<DioClient>()._dio;

  DioClient() {
    _dio.options
      ..baseUrl = baseURL
      ..connectTimeout = const Duration(seconds: 60)
      ..receiveTimeout = const Duration(seconds: 30);

    _dio.interceptors.add(ApiLogInterceptors());
  }

  static void setTokenInterceptor() {
    DioClient.instance.interceptors.clear();
    DioClient.instance.interceptors
      ..clear()
      ..addAll([
        ApiLogInterceptors(),
        ApiTokenInterceptors(instance),
      ]);
  }
}

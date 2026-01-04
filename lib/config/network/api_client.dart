/* Created by
   Varcant
   nanda.kista@gmail.com
*/

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:skybase/config/environment/app_env.dart';
import 'package:skybase/config/network/api_exception.dart';
import 'package:skybase/config/network/interceptors/api_log_interceptor.dart';
import 'package:skybase/config/network/interceptors/api_token_interceptor.dart';
import 'package:skybase/service_locator.dart';

enum ClientType {
  PRIMARY,
  // SECONDARY
}

class ApiClient {
  String tag = 'ApiClient::->';

  static final Dio _dio = sl<Dio>();

  static late final ApiClient call;
  // static late final DioClient otherClient;

  static void init() {
    call = ApiClient(ClientType.PRIMARY);
    // otherClient = DioClient(ClientType.CMS);
  }

  ApiClient(ClientType client) {
    _dio.options
      ..baseUrl = switch (client) {
        ClientType.PRIMARY => AppEnv.config.baseUrl,
        // ClientType.SECONDARY => AppEnv.config.baseUrl,
      }
      ..connectTimeout = const Duration(seconds: 60)
      ..receiveTimeout = const Duration(seconds: 30);

    _dio.interceptors.add(ApiLogInterceptors());
  }

  void addTokenInterceptor() {
    _dio.interceptors.clear();
    _dio.interceptors
      ..clear()
      ..addAll([ApiLogInterceptors(), ApiTokenInterceptors(_dio)]);
  }

  Future<Response> post({
    required String url,
    bool useToken = true,
    String? contentType = Headers.jsonContentType,
    Object? body,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    try {
      return await ApiClient._dio
          .post(
            url,
            data: _buildBody(contentType: contentType, body: body),
            options: await _buildOptions(contentType: contentType),
            queryParameters: queryParameters,
            cancelToken: cancelToken,
          )
          .safeError();
    } catch (e, stackTrace) {
      log('❌ $tag $e, $stackTrace');
      rethrow;
    }
  }

  Future<Response> get({
    required String url,
    bool useToken = true,
    String? contentType = Headers.jsonContentType,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    try {
      return await ApiClient._dio
          .get(
            url,
            options: await _buildOptions(contentType: contentType),
            queryParameters: queryParameters,
            cancelToken: cancelToken,
          )
          .safeError();
    } catch (e, stackTrace) {
      log('❌ $tag $e, $stackTrace');
      rethrow;
    }
  }

  Future<Response> patch({
    required String url,
    bool useToken = true,
    String? contentType = Headers.jsonContentType,
    Object? body,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    try {
      return await ApiClient._dio
          .patch(
            url,
            data: _buildBody(contentType: contentType, body: body),
            options: await _buildOptions(contentType: contentType),
            queryParameters: queryParameters,
            cancelToken: cancelToken,
          )
          .safeError();
    } catch (e, stackTrace) {
      log('❌ $tag $e, $stackTrace');
      rethrow;
    }
  }

  Future<Response> put({
    required String url,
    bool useToken = true,
    String? contentType = Headers.jsonContentType,
    Object? body,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    try {
      return await ApiClient._dio
          .put(
            url,
            data: _buildBody(contentType: contentType, body: body),
            options: await _buildOptions(contentType: contentType),
            queryParameters: queryParameters,
            cancelToken: cancelToken,
          )
          .safeError();
    } catch (e, stackTrace) {
      log('❌ $tag $e, $stackTrace');
      rethrow;
    }
  }

  Future<Response> delete({
    required String url,
    bool useToken = true,
    String? contentType = Headers.jsonContentType,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    try {
      return await ApiClient._dio
          .delete(
            url,
            options: await _buildOptions(contentType: contentType),
            queryParameters: queryParameters,
            cancelToken: cancelToken,
          )
          .safeError();
    } catch (e, stackTrace) {
      log('❌ $tag $e, $stackTrace');
      rethrow;
    }
  }

  Object? _buildBody({required String? contentType, required Object? body}) {
    if (contentType == Headers.jsonContentType) {
      return body = jsonEncode(body);
    } else if (contentType == Headers.formUrlEncodedContentType) {
      return body;
    } else if (contentType == Headers.multipartFormDataContentType) {
      (body as Map<String, dynamic>).removeWhere((k, v) => v == null);
      return FormData.fromMap(body);
    } else {
      return null;
    }
  }

  Future<Options> _buildOptions({
    Map<String, dynamic>? headers,
    String? contentType,
  }) async {
    // Uncomment this if you wanna use ApiTokenInterceptor
    ApiClient.call.addTokenInterceptor();

    final Map<String, dynamic> newHeaders = {'Accept': 'application/json'};

    newHeaders.addAll(headers ?? {});

    // TODO: Adjust based on your token
    // final token = await SecureStorageManager().getToken() ?? "";
    // if (!newHeaders.containsKey("Authorization") && token.isNotEmpty) {
    //   newHeaders["Authorization"] = 'Bearer $token';
    // }

    // TODO: Remove this, only for Github APIs
    newHeaders["Authorization"] = 'token ${AppEnv.config.clientToken}';

    return Options(headers: newHeaders, contentType: contentType);
  }
}

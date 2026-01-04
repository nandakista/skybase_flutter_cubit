/* Created by
   Varcant
   nanda.kista@gmail.com
*/

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:skybase/config/environment/app_env.dart';

import 'api_config.dart';
import 'api_exception.dart';

/// Base Request for calling API.
/// * Can be modify as needed.
class ApiRequest {
  static Future<Response> post({
    required String url,
    bool useToken = true,
    String? contentType = Headers.jsonContentType,
    Object? body,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    try {
      return await DioClient.instance.post(
        url,
        data: _buildBody(contentType: contentType, body: body),
        options: await _buildOptions(contentType: contentType),
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      ).safeError();
    } catch (e, stackTrace) {
      debugPrint('Api Request -> $e, $stackTrace');
      rethrow;
    }
  }

  static Future<Response> get({
    required String url,
    bool useToken = true,
    String? contentType = Headers.jsonContentType,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    try {
      return await DioClient.instance.get(
        url,
        options: await _buildOptions(contentType: contentType),
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      ).safeError();
    } catch (e, stackTrace) {
      debugPrint('Api Request -> $e, $stackTrace');
      rethrow;
    }
  }

  static Future<Response> patch({
    required String url,
    bool useToken = true,
    String? contentType = Headers.jsonContentType,
    Object? body,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    try {
      return await DioClient.instance.patch(
        url,
        data: _buildBody(contentType: contentType, body: body),
        options: await _buildOptions(contentType: contentType),
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      ).safeError();
    } catch (e, stackTrace) {
      debugPrint('Api Request -> $e, $stackTrace');
      rethrow;
    }
  }

  static Future<Response> put({
    required String url,
    bool useToken = true,
    String? contentType = Headers.jsonContentType,
    Object? body,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    try {
      return await DioClient.instance.put(
        url,
        data: _buildBody(contentType: contentType, body: body),
        options: await _buildOptions(contentType: contentType),
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      ).safeError();
    } catch (e, stackTrace) {
      debugPrint('Api Request -> $e, $stackTrace');
      rethrow;
    }
  }

  static Future<Response> delete({
    required String url,
    bool useToken = true,
    String? contentType = Headers.jsonContentType,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    try {
      return await DioClient.instance.delete(
        url,
        options: await _buildOptions(contentType: contentType),
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      ).safeError();
    } catch (e, stackTrace) {
      debugPrint('Api Request -> $e, $stackTrace');
      rethrow;
    }
  }

  static Object? _buildBody({required String? contentType, required Object? body}) {
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

  static Future<Options> _buildOptions({
    Map<String, dynamic>? headers,
    String? contentType,
  }) async {
    // Uncomment this if you wanna use ApiTokenInterceptor
    // DioClient.setTokenInterceptor();

    final Map<String, dynamic> newHeaders = {'Accept': 'application/json'};

    newHeaders.addAll(headers ?? {});

    // TODO: Adjust based on your token
    // final token = await SecureStorageManager().getToken() ?? "";
    // if (!newHeaders.containsKey("Authorization") && token.isNotEmpty) {
    //   newHeaders["Authorization"] = 'Bearer $token';
    // }

    // TODO: Remove this, only for Github APIs
    newHeaders["Authorization"] = 'token ${AppEnv.config.clientToken}';

    return Options(
      headers: newHeaders,
      contentType: contentType,
    );
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:skybase/config/environment/app_env.dart';

import 'api_config.dart';
import 'api_exception.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/

Map<String, String> headers = {HttpHeaders.authorizationHeader: ''};

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
      await _tokenManager(useToken);
      return await DioClient.instance.post(
        url,
        data: _setBody(contentType: contentType, body: body),
        options: Options(headers: headers, contentType: contentType),
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
      await _tokenManager(useToken);
      return await DioClient.instance.get(
        url,
        options: Options(headers: headers, contentType: contentType),
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
      await _tokenManager(useToken);
      return await DioClient.instance.patch(
        url,
        data: _setBody(contentType: contentType, body: body),
        options: Options(headers: headers, contentType: contentType),
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
      await _tokenManager(useToken);
      return await DioClient.instance.put(
        url,
        data: _setBody(contentType: contentType, body: body),
        options: Options(headers: headers, contentType: contentType),
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
      await _tokenManager(useToken);
      return await DioClient.instance.delete(
        url,
        options: Options(headers: headers),
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      ).safeError();
    } catch (e, stackTrace) {
      debugPrint('Api Request -> $e, $stackTrace');
      rethrow;
    }
  }

  static Object? _setBody({required String? contentType, required Object? body}) {
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

  static Future<void> _tokenManager(bool useToken) async {
    DioClient.setInterceptor();
    // String? token = await SecureStorageManager.instance.getToken();
    if (useToken) {
      headers[HttpHeaders.authorizationHeader] =
      'token ${AppEnv.config.clientToken}';
    } else {
      headers.clear();
    }
  }
}

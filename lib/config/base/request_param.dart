import 'package:dio/dio.dart';

class RequestParams {
  CancelToken cancelToken;
  bool? invalidateCache;

  RequestParams({
    required this.cancelToken,
    this.invalidateCache,
  });
}

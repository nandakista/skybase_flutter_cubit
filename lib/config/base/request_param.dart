import 'package:dio/dio.dart';

class RequestParams {
  CancelToken cancelToken;
  String? cachedKey;
  String? cachedId;

  RequestParams({
    required this.cancelToken,
    this.cachedKey,
    this.cachedId,
  });
}

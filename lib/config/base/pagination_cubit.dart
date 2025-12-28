/* Created by
   Varcant
   nanda.kista@gmail.com
*/

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skybase/core/mixin/connectivity_mixin.dart';

import 'request_param.dart';

abstract class PaginationCubit<T> extends Cubit<T> with ConnectivityMixin {
  late RequestParams requestParams;
  CancelToken cancelToken = CancelToken();

  PaginationCubit(super.initialState) {
    requestParams = RequestParams(
      cancelToken: cancelToken,
      cachedKey: cachedKey,
    );
    listenConnectivity(() {
      autoReconnect();
    });
  }

  String get cachedKey => '';

  void autoReconnect();

  void refreshPage() {}

  @override
  Future<void> close() {
    cancelConnectivity();
    cancelToken.cancel();
    return super.close();
  }
}

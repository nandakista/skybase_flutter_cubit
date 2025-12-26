/* Created by
   Varcant
   nanda.kista@gmail.com
*/

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skybase/config/base/request_param.dart';
import 'package:skybase/core/mixin/cache_mixin.dart';
import 'package:skybase/core/mixin/connectivity_mixin.dart';

class BaseCubit<S, T> extends Cubit<S> with ConnectivityMixin, CacheMixin {
  BaseCubit(super.initialState);

  CancelToken cancelToken = CancelToken();
  late RequestParams requestParams;
  String? errorMessage;
  bool isError = false;
  bool isLoading = false;

  String get cachedKey => '';

  String get cachedId => '';

  void loadData(Function() onLoad) {
    onLoad();
  }

  @mustCallSuper
  void onInit([dynamic args]) {
    requestParams = RequestParams(
      cancelToken: cancelToken,
      cachedKey: cachedKey,
      cachedId: cachedId,
    );
    listenConnectivity(() {
      if (isError && !isLoading) onRefresh();
    });
  }

  void onRefresh([BuildContext? context]) {}

  // Future<void> deleteCached(String cacheKey, {String? cacheId}) async {
  //   if (cacheId != null) {
  //     await storage.delete('$cacheKey/$cacheId');
  //   } else {
  //     await storage.delete(cacheKey.toString());
  //   }
  // }

  void emitLoading(S state) {
    isLoading = true;
    isError = false;
    emit(state);
  }

  void emitSuccess(S state) {
    isLoading = false;
    isError = false;
    emit(state);
  }

  void emitError(S state) {
    isError = true;
    isLoading = false;
    emit(state);
  }

  @override
  @mustCallSuper
  Future<void> close() {
    onClose();
    cancelToken.cancel();
    cancelConnectivity();
    return super.close();
  }

  @mustCallSuper
  void onClose() {}
}
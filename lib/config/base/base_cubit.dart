import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skybase/core/database/storage/storage_manager.dart';

class BaseCubit<S, T> extends Cubit<S> {
  BaseCubit(super.initialState);

  StorageManager storage = StorageManager.instance;

  CancelToken cancelToken = CancelToken();
  String? errorMessage;

  void loadData(Function() onLoad) {
    onLoad();
  }

  @mustCallSuper
  void onInit([dynamic args]) {}

  void onRefresh([BuildContext? context]) {}

  Future<void> deleteCached(String cacheKey, {String? cacheId}) async {
    if (cacheId != null) {
      await storage.delete('$cacheKey/$cacheId');
    } else {
      await storage.delete(cacheKey.toString());
    }
  }

  @override
  @mustCallSuper
  Future<void> close() {
    onClose();
    cancelToken.cancel();
    return super.close();
  }

  @mustCallSuper
  void onClose() {}
}
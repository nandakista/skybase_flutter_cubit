/* Created by
   Varcant
   nanda.kista@gmail.com
*/

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:skybase/core/database/storage/storage_manager.dart';

class PaginationCubit<S, T> extends Cubit<S> {
  PaginationCubit(super.initialState);

  StorageManager storage = StorageManager.instance;

  CancelToken cancelToken = CancelToken();
  int perPage = 20;
  int page = 1;
  final pagingController = PagingController<int, T>(firstPageKey: 0);

  @mustCallSuper
  void onInit([dynamic args]) {}

  @mustCallSuper
  void onRefresh([BuildContext? context]) {
    page = 1;
    pagingController.refresh();
  }

  Future<void> deleteCached(String cacheKey) async {
    await storage.delete(cacheKey.toString());
  }

  void loadData(Function() onLoad) {
    pagingController.addPageRequestListener((page) => onLoad());
  }

  void showError(String message) {
    pagingController.error = message;
  }

  void loadNextData({required List<T> data, int? page}) {
    final isLastPage = data.length < perPage;
    if (isLastPage) {
      pagingController.appendLastPage(data);
    } else {
      pagingController.appendPage(data, page ?? this.page++);
    }
  }

  void finishLoad({List<T>? data, int? page, String? error}) {
    if (error != null) {
      showError(error);
    } else {
      loadNextData(data: data ?? [], page: page);
    }
  }

  void finishAndEmit({required S state, List<T>? data, int? page, String? error}) {
    finishLoad(data: data, page: page, error: error);
    emit(state);
  }

  @override
  @mustCallSuper
  Future<void> close() {
    pagingController.dispose();
    cancelToken.cancel();
    return super.close();
  }
}
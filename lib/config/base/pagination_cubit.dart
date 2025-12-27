// /* Created by
//    Varcant
//    nanda.kista@gmail.com
// */
//
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
// import 'package:skybase/config/base/request_param.dart';
// import 'package:skybase/core/mixin/cache_mixin.dart';
// import 'package:skybase/core/mixin/connectivity_mixin.dart';
//
// class PaginationCubit<S, T> extends Cubit<S> with ConnectivityMixin, CacheMixin {
//   PaginationCubit(super.initialState);
//
//   CancelToken cancelToken = CancelToken();
//   late RequestParams requestParams;
//   int perPage = 20;
//   int page = 1;
//   final scrollController = ScrollController();
//   final pagingController = PagingController<int, T>(firstPageKey: 0);
//
//   String get cachedKey => '';
//
//   @mustCallSuper
//   void onInit([dynamic args]) {
//     requestParams = RequestParams(
//       cancelToken: cancelToken,
//       cachedKey: cachedKey,
//     );
//     listenConnectivity(() {
//       if (pagingController.value.status == PagingStatus.firstPageError) {
//         onRefresh();
//       }
//     });
//   }
//
//   @mustCallSuper
//   void onRefresh([BuildContext? context]) {
//     page = 1;
//     pagingController.refresh();
//   }
//
//   void loadData(Function() onLoad) {
//     pagingController.addPageRequestListener((page) => onLoad());
//   }
//
//   void showError(String message) {
//     pagingController.error = message;
//   }
//
//   void loadNextData({required List<T> data, int? page}) {
//     final isLastPage = data.length < perPage;
//     if (isLastPage) {
//       pagingController.appendLastPage(data);
//     } else {
//       pagingController.appendPage(data, page ?? this.page++);
//     }
//   }
//
//   void emitLoading(S state) {
//     emit(state);
//   }
//
//   void emitSuccess(S state, {List<T>? data, int? page}) {
//     loadNextData(data: data ?? [], page: page);
//     emit(state);
//   }
//
//   void emitError(S state, {String? message}) {
//     pagingController.error = message;
//     emit(state);
//   }
//
//   @override
//   @mustCallSuper
//   Future<void> close() {
//     pagingController.dispose();
//     scrollController.dispose();
//     cancelToken.cancel();
//     cancelConnectivity();
//     return super.close();
//   }
// }

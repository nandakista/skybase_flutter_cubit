/* Created by
   Varcant
   nanda.kista@gmail.com
*/

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class PaginationCubit<T> extends Cubit<T> {
  CancelToken cancelToken = CancelToken();

  PaginationCubit(super.initialState);

  void refreshPage();

  @override
  Future<void> close() {
    cancelToken.cancel();
    return super.close();
  }
}

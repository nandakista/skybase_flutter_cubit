/* Created by
   Varcant
   nanda.kista@gmail.com
*/

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<S> extends Cubit<S> {
  CancelToken cancelToken = CancelToken();

  BaseCubit(super.initialState);

  @override
  @mustCallSuper
  Future<void> close() {
    cancelToken.cancel();
    return super.close();
  }
}

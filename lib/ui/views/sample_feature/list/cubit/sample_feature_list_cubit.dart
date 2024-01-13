import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skybase/data/models/sample_feature/sample_feature.dart';
import 'package:skybase/data/repositories/sample_feature/sample_feature_repository.dart';

part 'sample_feature_list_state.dart';

class SampleFeatureListCubit extends Cubit<SampleFeatureListState> {
  String tag = 'SampleFeatureListBloc::->';

  final SampleFeatureRepository repository;
  CancelToken cancelToken = CancelToken();

  SampleFeatureListCubit(this.repository) : super(SampleFeatureListInitial()) {
    onLoadData();
  }

  void onLoadData({
    int page = 1,
    int perPage = 10,
  }) async {
    try {
      emit(SampleFeatureListLoading());
      final response = await repository.getUsers(
        cancelToken: cancelToken,
        page: page,
        perPage: perPage,
      );
      emit(SampleFeatureListLoaded(response));
    } catch (e) {
      emit(SampleFeatureListError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    cancelToken.cancel();
    return super.close();
  }
}

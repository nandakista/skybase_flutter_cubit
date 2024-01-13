import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skybase/core/database/storage/storage_manager.dart';
import 'package:skybase/data/models/sample_feature/sample_feature.dart';
import 'package:skybase/data/repositories/sample_feature/sample_feature_repository.dart';
import 'package:skybase/data/sources/local/cached_key.dart';

part 'sample_feature_detail_state.dart';

class SampleFeatureDetailCubit extends Cubit<SampleFeatureDetailState> {
  String tag = 'SampleFeatureDetailBloc::->';

  final SampleFeatureRepository repository;
  CancelToken cancelToken = CancelToken();

  SampleFeatureDetailCubit(this.repository)
      : super(SampleFeatureDetailInitial());

  Future<void> onRefreshData({
    required int id,
    required String username,
  }) async {
    await StorageManager.instance
        .delete('${CachedKey.SAMPLE_FEATURE_DETAIL}/$id');
    await onLoadData(id: id, username: username);
  }

  Future<void> onLoadData({
    required int id,
    required String username,
  }) async {
    try {
      emit(SampleFeatureDetailLoading());
      final response = await repository.getDetailUser(
        cancelToken: cancelToken,
        id: id,
        username: username,
      );
      emit(SampleFeatureDetailLoaded(response));
    } catch (e) {
      emit(SampleFeatureDetailError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    cancelToken.cancel();
    return super.close();
  }
}

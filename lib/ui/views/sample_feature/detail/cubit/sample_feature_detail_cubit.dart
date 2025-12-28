import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:skybase/config/base/base_cubit.dart';
import 'package:skybase/config/base/request_param.dart';
import 'package:skybase/config/base/request_state.dart';
import 'package:skybase/data/models/sample_feature/sample_feature.dart';
import 'package:skybase/data/repositories/sample_feature/sample_feature_repository.dart';
import 'package:skybase/data/sources/local/cached_key.dart';

part 'sample_feature_detail_state.dart';

class SampleFeatureDetailCubit extends BaseCubit<SampleFeatureDetailState> {
  String tag = 'SampleFeatureDetailCubit::->';

  final SampleFeatureRepository repository;

  SampleFeatureDetailCubit(this.repository) : super(SampleFeatureDetailState());

  Future<void> getUserDetail({
    required int userId,
    required String userName,
  }) async {
    try {
      emit(state.copyWith(status: RequestStatus.loading));
      final response = await repository.getDetailUser(
        requestParams: RequestParams(
          cancelToken: cancelToken,
          cachedKey: CachedKey.SAMPLE_FEATURE_DETAIL,
          cachedId: userId.toString(),
        ),
        id: userId,
        username: userName,
      );
      emit(state.copyWith(status: RequestStatus.success, result: response));
    } catch (e) {
      emit(state.copyWith(status: RequestStatus.error, error: e));
    }
  }
}

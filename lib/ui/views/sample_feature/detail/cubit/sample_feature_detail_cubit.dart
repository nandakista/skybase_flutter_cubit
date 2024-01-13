import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:skybase/config/base/base_cubit.dart';
import 'package:skybase/core/database/storage/storage_manager.dart';
import 'package:skybase/data/models/sample_feature/sample_feature.dart';
import 'package:skybase/data/repositories/sample_feature/sample_feature_repository.dart';
import 'package:skybase/data/sources/local/cached_key.dart';

part 'sample_feature_detail_state.dart';

class SampleFeatureDetailCubit
    extends BaseCubit<SampleFeatureDetailState, SampleFeature> {
  String tag = 'SampleFeatureDetailCubit::->';

  final SampleFeatureRepository repository;

  SampleFeatureDetailCubit(this.repository)
      : super(SampleFeatureDetailInitial());

  late int argsId;
  late String argsUsername;

  @override
  void onInit([dynamic args]) {
    argsId = args['id'];
    argsUsername = args['username'];
    loadData(() => onLoadData());
    super.onInit(args);
  }

  @override
  void onRefresh([BuildContext? context]) async {
    super.onRefresh(context);
    await StorageManager.instance
        .delete('${CachedKey.SAMPLE_FEATURE_DETAIL}/$argsId');
    await onLoadData();
  }

  Future<void> onLoadData() async {
    try {
      emitLoading(SampleFeatureDetailLoading());
      final response = await repository.getDetailUser(
        cancelToken: cancelToken,
        id: argsId,
        username: argsUsername,
      );
      emitSuccess(SampleFeatureDetailLoaded(response));
    } catch (e) {
      emitError(SampleFeatureDetailError(e.toString()));
    }
  }
}

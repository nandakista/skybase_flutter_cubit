import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:skybase/config/base/pagination_cubit.dart';
import 'package:skybase/data/models/sample_feature/sample_feature.dart';
import 'package:skybase/data/repositories/sample_feature/sample_feature_repository.dart';
import 'package:skybase/data/sources/local/cached_key.dart';

part 'sample_feature_list_state.dart';

class SampleFeatureListCubit
    extends PaginationCubit<SampleFeatureListState, SampleFeature> {
  String tag = 'SampleFeatureListCubit::->';

  final SampleFeatureRepository repository;

  SampleFeatureListCubit(this.repository) : super(SampleFeatureListInitial());

  @override
  void onInit([dynamic args]) {
    loadData(() => onLoadData());
    super.onInit(args);
  }

  @override
  void onRefresh([BuildContext? context]) async {
    await deleteCached(CachedKey.SAMPLE_FEATURE_LIST);
    super.onRefresh();
  }

  void onLoadData() async {
    try {
      emit(SampleFeatureListLoading());
      final response = await repository.getUsers(
        cancelToken: cancelToken,
        page: page,
        perPage: perPage,
      );
      finishAndEmit(
        state: SampleFeatureListLoaded(response),
        data: response,
      );
    } catch (e) {
      debugPrint('Error : $e');
      finishAndEmit(
        state: SampleFeatureListError(e.toString()),
        error: e.toString(),
      );
    }
  }
}

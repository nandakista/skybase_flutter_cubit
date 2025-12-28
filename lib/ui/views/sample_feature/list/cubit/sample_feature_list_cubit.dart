import 'package:flutter/foundation.dart';
import 'package:skybase/config/base/pagination_cubit.dart';
import 'package:skybase/data/models/sample_feature/sample_feature.dart';
import 'package:skybase/data/repositories/sample_feature/sample_feature_repository.dart';
import 'package:skybase/config/base/pagination_state.dart';

part 'sample_feature_list_state.dart';

class SampleFeatureListCubit extends PaginationCubit<SampleFeatureListState> {
  String tag = 'SampleFeatureListCubit::->';

  final SampleFeatureRepository repository;

  SampleFeatureListCubit(this.repository) : super(SampleFeatureListState()) {
    fetchNextPage();
  }

  PaginationState<SampleFeature> get pagination => state.pagination;

  @override
  String get cachedKey => 'sample_feature';

  @override
  void autoReconnect() {
    if (pagination.page == 1) {
      refreshPage();
    }
  }

  @override
  void refreshPage() async {
    emit(const SampleFeatureListState());
    await fetchNextPage();
    super.refreshPage();
  }

  Future<void> fetchNextPage() async {
    if (pagination.isLoading || !pagination.hasNextPage) return;
    emit(
      SampleFeatureListState(
        pagination: pagination.copyWith(isLoading: true),
      ),
    );
    try {
      final response = await repository.getUsers(
        requestParams: requestParams,
        page: pagination.page,
        perPage: pagination.pageSize,
      );
      final isLastPage = response.length < pagination.pageSize;
      emit(
        SampleFeatureListState(
          pagination: pagination.copyWith(
            isLoading: false,
            items: [...pagination.items, ...response],
            page: pagination.page + 1,
            hasNextPage: !isLastPage,
          ),
        ),
      );
    } catch (e) {
      emit(
        SampleFeatureListState(
          pagination: pagination.copyWith(isLoading: false, error: e),
        ),
      );
    }
  }
}

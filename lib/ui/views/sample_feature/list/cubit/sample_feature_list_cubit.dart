import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:skybase/config/base/pagination_cubit.dart';
import 'package:skybase/config/base/request_param.dart';
import 'package:skybase/data/models/sample_feature/sample_feature.dart';
import 'package:skybase/data/repositories/sample_feature/sample_feature_repository.dart';
import 'package:skybase/config/base/pagination_state.dart';
import 'package:skybase/data/sources/local/cached_key.dart';

part 'sample_feature_list_state.dart';

class SampleFeatureListCubit extends PaginationCubit<SampleFeatureListState> {
  String tag = 'SampleFeatureListCubit::->';

  final SampleFeatureRepository repository;

  SampleFeatureListCubit(this.repository) : super(SampleFeatureListState());

  PaginationState<SampleFeature> get pagination => state.pagination;

  @override
  void refreshPage() async {
    emit(state.copyWith(pagination: PaginationState()));
    await fetchNextPage();
  }

  Future<void> search(String query) async {
    if (state.query == query) return;
    emit(state.copyWith(query: query, pagination: PaginationState()));
    await fetchNextPage();
  }

  Future<void> fetchNextPage() async {
    if (pagination.isLoading || !pagination.hasNextPage) return;
    emit(state.copyWith(pagination: pagination.copyWith(isLoading: true)));
    try {
      final response = await repository.getUsers(
        requestParams: RequestParams(
          cancelToken: cancelToken,
          cachedKey: CachedKey.SAMPLE_FEATURE_LIST,
        ),
        page: pagination.page,
        perPage: pagination.pageSize,
        username: state.query,
      );
      final isLastPage = response.length < pagination.pageSize;
      emit(
        state.copyWith(
          pagination: pagination.copyWith(
            isLoading: false,
            items: [...pagination.items, ...response],
            page: pagination.page + 1,
            hasNextPage: !isLastPage,
          ),
        ),
      );
    } catch (e, stackTrace) {
      log('❌ Error while fetch data: $e, $stackTrace');
      emit(
        state.copyWith(
          pagination: pagination.copyWith(isLoading: false, error: e),
        ),
      );
    }
  }
}

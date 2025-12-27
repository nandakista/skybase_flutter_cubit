import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skybase/config/base/request_param.dart';
import 'package:skybase/data/models/sample_feature/sample_feature.dart';
import 'package:skybase/data/repositories/sample_feature/sample_feature_repository.dart';

part 'sample_feature_list_state.dart';

class SampleFeatureListCubit extends Cubit<PaginationState<SampleFeature>> {
  String tag = 'SampleFeatureListCubit::->';

  final SampleFeatureRepository repository;

  SampleFeatureListCubit(this.repository) : super(PaginationState()) {
   fetchNextPage();
  }

  CancelToken cancelToken = CancelToken();

  Future<void> refresh() async {
    emit(const PaginationState());
    await fetchNextPage();
  }

  Future<void> fetchNextPage() async {
    if (state.isLoading || !state.hasNextPage) return;
    emit(state.copyWith(isLoading: true));
    try {
      final response = await repository.getUsers(
        requestParams: RequestParams(cancelToken: cancelToken),
        page: state.page,
        perPage: state.pageSize,
      );
      final isLastPage = response.length < state.pageSize;
      emit(
        state.copyWith(
          isLoading: false,
          items: [...state.items, ...response],
          page: state.page + 1,
          hasNextPage: !isLastPage,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e));
    }
  }

  @override
  Future<void> close() {
    cancelToken.cancel();
    return super.close();
  }
}

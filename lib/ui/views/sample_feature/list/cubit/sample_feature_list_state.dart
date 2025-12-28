part of 'sample_feature_list_cubit.dart';

@immutable
class SampleFeatureListState {
  final PaginationState<SampleFeature> pagination;
  const SampleFeatureListState({this.pagination = const PaginationState()});
}

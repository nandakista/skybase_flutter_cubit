part of 'sample_feature_list_cubit.dart';

@immutable
class SampleFeatureListState extends Equatable {
  final PaginationState<SampleFeature> pagination;
  final String? query;

  const SampleFeatureListState({
    this.pagination = const PaginationState(),
    this.query,
  });

  SampleFeatureListState copyWith({
    String? query,
    PaginationState<SampleFeature>? pagination,
  }) {
    return SampleFeatureListState(
      query: query ?? this.query,
      pagination: pagination ?? this.pagination,
    );
  }

  @override
  List<Object?> get props => [pagination, query];
}

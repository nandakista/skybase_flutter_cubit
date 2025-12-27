part of '../cubit/sample_feature_list_cubit.dart';

@immutable
class PaginationState<T> {
  final List<T> items;
  final int page;
  final int pageSize;
  final bool isLoading;
  final bool hasNextPage;
  final Object? error;

  const PaginationState({
    this.items = const [],
    this.page = 1,
    this.pageSize = 20,
    this.isLoading = false,
    this.hasNextPage = true,
    this.error,
  });

  PaginationState<T> copyWith({
    List<T>? items,
    int? page,
    bool? isLoading,
    bool? hasNextPage,
    Object? error,
  }) {
    return PaginationState<T>(
      items: items ?? this.items,
      page: page ?? this.page,
      isLoading: isLoading ?? this.isLoading,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      error: error,
    );
  }
}

//
// @immutable
// sealed class SampleFeatureListState extends Equatable {
//   const SampleFeatureListState();
//
//   @override
//   List<Object?> get props => [];
// }
//
// class SampleFeatureListInitial extends SampleFeatureListState {}
//
// class SampleFeatureListLoading extends SampleFeatureListState {}
//
// class SampleFeatureListError extends SampleFeatureListState {
//   final String message;
//
//   const SampleFeatureListError(this.message);
//
//   @override
//   List<Object> get props => [message];
// }
//
// class SampleFeatureListLoaded extends SampleFeatureListState {
//   final List<SampleFeature> result;
//
//   const SampleFeatureListLoaded(this.result);
//
//   @override
//   List<Object> get props => [result];
// }

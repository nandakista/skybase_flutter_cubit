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
      error: error ?? this.error,
    );
  }
}

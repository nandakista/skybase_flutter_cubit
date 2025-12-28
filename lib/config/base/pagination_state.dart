import 'package:flutter/foundation.dart';

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
    int? pageSize,
    bool? isLoading,
    bool? hasNextPage,
    Object? error,
  }) {
    return PaginationState<T>(
      items: items ?? this.items,
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
      isLoading: isLoading ?? this.isLoading,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      /// Prevent to save current value if error is null
      /// Because error == null indicate that the state is [loading]
      error: error,
    );
  }

  @override
  String toString() {
    return '\n'
        '⚠️============= PaginationState ================\n'
        '- items: ${items.length}\n'
        '- page: $page\n'
        '- pageSize: $pageSize\n'
        '- isLoading: $isLoading\n'
        '- hasNextPage: $hasNextPage\n'
        '- error: $error\n'
        '⚠️============== PaginationState ===============';
  }
}

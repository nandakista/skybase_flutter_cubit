import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'pagination_state.dart';

extension PaginationStateExtension<T> on PaginationState<T> {
  /// Convert [PaginationState] Cubit to [PagingState] infinite_scroll_pagination
  ///
  /// The infinite_scroll_pagination will auto fetch on below conditions
  /// ```
  /// PagingState(
  ///   pages: null,
  ///   keys: null,
  ///   isLoading: false,
  ///   hasNextPage: false,
  /// )
  ///```
  ///
  /// We need to handle this auto fetch only if state.page == 1,
  /// So we need to put below conditions to handle this
  /// ```
  /// pages: state.page == 1 ? null : state.items.isEmpty ? <List<T>>[] : pages,
  /// keys: state.page == 1 ? null : state.items.isEmpty ? <int>[] : keys,
  /// ```
  /// If we already handle this, we don't need call fetch page again in onInit
  PagingState<int, T> get toPagingState {
    final pages = <List<T>>[];
    for (var start = 0; start < items.length; start += pageSize) {
      pages.add(
        items.sublist(start, (start + pageSize).clamp(0, items.length)),
      );
    }

    final keys = List.generate(pages.length, (i) => i + 1);

    return PagingState<int, T>(
      pages:
          page == 1
              ? null
              : items.isEmpty
              ? <List<T>>[]
              : pages,
      keys:
          page == 1
              ? null
              : items.isEmpty
              ? <int>[]
              : keys,
      isLoading: isLoading,
      hasNextPage: hasNextPage,
      error: error,
    );
  }

  PaginationState<T> reset() => PaginationState<T>();

  PaginationState<T> loading() => copyWith(isLoading: true);

  PaginationState<T> append(List<T> newItems, {required bool hasNextPage}) {
    return copyWith(
      isLoading: false,
      items: [...items, ...newItems],
      page: newItems.isNotEmpty ? page + 1 : page,
      hasNextPage: hasNextPage,
    );
  }

  PaginationState<T> fail(Object error) {
    return copyWith(isLoading: false, error: error);
  }

  bool get isLoading => this.isLoading;

  bool get isLoadMore => this.isLoading && items.isNotEmpty;

  bool get isEmpty => !isLoading && error == null && items.isEmpty;

  bool get isSuccess => !isLoading && error == null && items.isNotEmpty;

  bool get isError => !isLoading && error != null;

  bool get isErrorLoadMore => !isLoading && error != null && items.isNotEmpty;
}

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'pagination_state.dart';


/// Convert [PaginationState] from Cubit to [PagingState] from infinite_scroll_pagination
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
PagingState<int, T> toPagingState<T>(PaginationState<T> state) {
  final pages = <List<T>>[];

  for (var start = 0; start < state.items.length; start += state.pageSize) {
    pages.add(
      state.items.sublist(
        start,
        (start + state.pageSize).clamp(0, state.items.length),
      ),
    );
  }

  final keys = List.generate(pages.length, (i) => i + 1);

  return PagingState<int, T>(
    pages: state.page == 1 ? null : state.items.isEmpty ? <List<T>>[] : pages,
    keys: state.page == 1 ? null : state.items.isEmpty ? <int>[] : keys,
    isLoading: state.isLoading,
    hasNextPage: state.hasNextPage,
    error: state.error,
  );
}

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'pagination_state.dart';

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
extension PaginationStateExtension<T> on PaginationState<T> {
  PagingState<int, T> get toPagingState {
    final pages = <List<T>>[];
    for (var start = 0; start < items.length; start += pageSize) {
      pages.add(
        items.sublist(start, (start + pageSize).clamp(0, items.length)),
      );
    }

    final keys = List.generate(pages.length, (i) => i + 1);

    return PagingState<int, T>(
      pages: page == 1 ? null : items.isEmpty ? <List<T>>[] : pages,
      keys: page == 1 ? null : items.isEmpty ? <int>[] : keys,
      isLoading: isLoading,
      hasNextPage: hasNextPage,
      error: error,
    );
  }
}

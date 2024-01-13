/* Created by
   Varcant
   nanda.kista@gmail.com
*/

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:skybase/ui/widgets/base/base_view.dart';
import 'package:skybase/ui/widgets/base/sky_pagination_view.dart';

abstract class SkyView {
  static Widget page({
    required bool loadingEnabled,
    required bool errorEnabled,
    required bool emptyEnabled,
    required onRetry,
    required Widget child,
    bool emptyRetryEnabled = false,
    String? emptyTitle,
    String? emptyImage,
    String? emptySubtitle,
    Widget? loadingView,
    bool visibleOnEmpty = true,
    bool visibleOnError = true,
    Widget? errorImageWidget,
    String? errorSubtitle,
    String? errorTitle,
    Widget? errorView,
    Widget? emptyView,
    String? retryText,
    VoidCallback? onRefresh,
    double? imageSize,
    double? verticalSpacing,
    double? horizontalSpacing,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    String? errorImage,
    Widget? retryWidget,
    Widget? emptyImageWidget,
  }) {
    return BaseView(
      isComponent: false,
      loadingEnabled: loadingEnabled,
      errorEnabled: errorEnabled,
      emptyRetryEnabled: emptyRetryEnabled,
      emptyEnabled: emptyEnabled,
      onRetry: onRetry,
      onRefresh: onRefresh,
      loadingView: loadingView,
      visibleOnEmpty: visibleOnEmpty,
      imageSize: imageSize,
      horizontalSpacing: imageSize,
      verticalSpacing: verticalSpacing,
      subtitleStyle: subtitleStyle,
      titleStyle: titleStyle,
      emptyImageWidget: emptyImageWidget,
      retryWidget: retryWidget,
      retryText: retryText,
      errorImageWidget: errorImageWidget,
      errorImage: errorImage,
      errorTitle: errorTitle,
      errorSubtitle: errorSubtitle,
      emptyTitle: emptyTitle,
      emptyView: emptyView,
      emptyImage: emptyImage,
      emptySubtitle: emptySubtitle,
      errorView: errorView,
      visibleOnError: visibleOnError,
      child: child,
    );
  }

  static Widget component({
    required bool loadingEnabled,
    required bool errorEnabled,
    required bool emptyEnabled,
    required onRetry,
    required Widget child,
    String? emptyTitle,
    String? emptyImage,
    String? emptySubtitle,
    Widget? loadingView,
    bool visibleOnEmpty = true,
    bool visibleOnError = true,
    Widget? errorImageWidget,
    String? errorSubtitle,
    String? errorTitle,
    Widget? errorView,
    Widget? emptyView,
    String? retryText,
    double? imageSize,
    double? verticalSpacing,
    double? horizontalSpacing,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    String? errorImage,
    Widget? retryWidget,
    Widget? emptyImageWidget,
  }) {
    return BaseView(
      isComponent: true,
      loadingEnabled: loadingEnabled,
      errorEnabled: errorEnabled,
      emptyEnabled: emptyEnabled,
      onRetry: onRetry,
      loadingView: loadingView,
      visibleOnEmpty: visibleOnEmpty,
      imageSize: imageSize,
      horizontalSpacing: imageSize,
      verticalSpacing: verticalSpacing,
      subtitleStyle: subtitleStyle,
      titleStyle: titleStyle,
      emptyImageWidget: emptyImageWidget,
      retryWidget: retryWidget,
      retryText: retryText,
      errorImageWidget: errorImageWidget,
      errorImage: errorImage,
      errorTitle: errorTitle,
      errorSubtitle: errorSubtitle,
      emptyTitle: emptyTitle,
      emptyView: emptyView,
      emptyImage: emptyImage,
      emptySubtitle: emptySubtitle,
      errorView: errorView,
      visibleOnError: visibleOnError,
      child: child,
    );
  }

  static Widget pagination<ItemType>({
    required PagingController<int, ItemType> pagingController,
    required ItemWidgetBuilder<ItemType> itemBuilder,
    bool emptyEnabled = true,
    bool errorEnabled = true,
    Widget? loadingView,
    Widget? emptyView,
    Widget? maxItemView,
    Widget? errorView,
    Widget? errorLoadView,
    bool shrinkWrap = false,
    ScrollPhysics? physics,
    Widget? separator,
    VoidCallback? onRefresh,
    Widget? emptyImageWidget,
    String? emptyImage,
    String? errorTitle,
    String? errorSubtitle,
    String? emptyTitle,
    String? emptySubtitle,
    TextStyle? emptyTitleStyle,
    TextStyle? emptySubtitleStyle,
    bool enableIOSStyle = true,
    String? errorImage,
    Widget? errorImageWidget,
    String? retryText,
    double? verticalSpacing,
    double? horizontalSpacing,
    double? imageSize,
    TextStyle? errorTitleStyle,
    TextStyle? errorSubtitleStyle,
    Widget? retryWidget,
    Axis scrollDirection = Axis.vertical,
    EdgeInsetsGeometry? padding,
  }) {
    return BasePaginationView<ItemType>(
      pagingController: pagingController,
      itemBuilder: itemBuilder,
      padding: padding,
      loadingView: loadingView,
      emptyEnabled: emptyEnabled,
      emptyImage: emptyImage,
      emptyImageWidget: emptyImageWidget,
      emptySubtitle: emptySubtitle,
      emptySubtitleStyle: emptySubtitleStyle,
      emptyTitle: emptyTitle,
      emptyTitleStyle: emptyTitleStyle,
      emptyView: emptyView,
      enableIOSStyle: enableIOSStyle,
      errorEnabled: errorEnabled,
      errorImage: errorImage,
      errorImageWidget: errorImageWidget,
      errorLoadView: errorLoadView,
      errorTitle: errorTitle,
      errorTitleStyle: errorTitleStyle,
      errorSubtitle: errorSubtitle,
      errorSubtitleStyle: errorSubtitleStyle,
      horizontalSpacing: horizontalSpacing,
      verticalSpacing: verticalSpacing,
      imageSize: imageSize,
      maxItemView: maxItemView,
      retryText: retryText,
      retryWidget: retryWidget,
      scrollDirection: scrollDirection,
      separator: separator,
      shrinkWrap: shrinkWrap,
      physics: physics,
      onRefresh: onRefresh,
      errorView: errorView,
    );
  }
}
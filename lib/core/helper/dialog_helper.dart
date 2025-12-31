import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:skybase/ui/routes/navigator/app_navigator.dart';
import 'package:skybase/ui/widgets/platform_loading_indicator.dart';
import 'package:skybase/ui/widgets/sky_dialog.dart';

class LoadingDialog {
  static Future<T?> show<T>(BuildContext context, {bool? dismissible}) {
    return showGeneralDialog<T>(
      context: context,
      barrierLabel: 'Barrier',
      barrierDismissible: dismissible ?? false,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      pageBuilder: (_, _, _) {
        return Center(
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(16),
            child: const PlatformLoadingIndicator(),
          ),
        );
      },
    );
  }

  static void dismiss(BuildContext context) => navigator.pop();
}

class DialogHelper {
  static Future<T?> failed<T>({
    required BuildContext context,
    required String message,
    VoidCallback? onConfirm,
    Widget? header,
    bool? isDismissible,
    String? title,
  }) {
    return showDialog<T>(
      barrierDismissible: isDismissible ?? true,
      context: context,
      builder: (context) => DialogAlert.error(
        header: header,
        title: title ?? 'txt_failed'.tr(),
        description: message,
        onConfirm: onConfirm ?? () => dismiss(context),
        isDismissible: isDismissible ?? true,
      ),
    );
  }

  static Future<T?> success<T>({
    required BuildContext context,
    required String message,
    required VoidCallback onConfirm,
    Widget? header,
    bool? isDismissible,
    String? title,
  }) {
    return showDialog<T>(
      barrierDismissible: isDismissible ?? false,
      context: context,
      builder: (context) => DialogAlert.success(
        header: header,
        title: title ?? 'txt_success'.tr(),
        description: message,
        onConfirm: onConfirm,
        isDismissible: isDismissible ?? false,
      ),
    );
  }

  static Future<T?> warning<T>({
    required BuildContext context,
    required String message,
    required VoidCallback onConfirm,
    Widget? header,
    bool? isDismissible,
    String? title,
    String? confirmText,
    String? cancelText,
    VoidCallback? onCancel,
}) {
    return showDialog<T>(
      barrierDismissible: isDismissible ?? true,
      context: context,
      builder: (context) => DialogAlert.warning(
        header: header,
        isDismissible: isDismissible ?? false,
        title: title ?? 'txt_warning'.tr(),
        description: message,
        onConfirm: onConfirm,
        confirmText: confirmText,
        onCancel: onCancel ?? () => dismiss(context),
        cancelText: cancelText,
      ),
    );
  }

  static Future<T?> retry<T>({
    required BuildContext context,
    required String message,
    required VoidCallback onConfirm,
    bool? isDismissible,
    Widget? header,
    String? title,
    String? confirmText,
    String? cancelText,
    VoidCallback? onCancel,
}) {
    return showDialog<T>(
      barrierDismissible: isDismissible ?? true,
      context: context,
      builder: (context) => DialogAlert.retry(
        header: header,
        title: title ?? 'txt_failed'.tr(),
        description: message,
        confirmText: confirmText,
        cancelText: cancelText,
        onConfirm: onConfirm,
        onCancel: onCancel ?? () => dismiss(context),
        isDismissible: isDismissible ?? true,
      ),
    );
  }

  static Future<T?> force<T>({
    required BuildContext context,
    required String message,
    required VoidCallback onConfirm,
    bool? isDismissible,
    Widget? header,
    String? title,
    VoidCallback? onCancel,
    String? confirmText,
  }) {
    return showDialog<T>(
      barrierDismissible: false,
      context: context,
      builder: (context) => DialogAlert.force(
        header: header,
        title: title ?? 'txt_warning'.tr(),
        description: message,
        onConfirm: onConfirm,
        onCancel: onCancel ?? () => dismiss(context),
        confirmText: confirmText ?? 'OK',
        isDismissible: isDismissible ?? false,
      ),
    );
  }

  static void dismiss(BuildContext context) => navigator.pop();
}

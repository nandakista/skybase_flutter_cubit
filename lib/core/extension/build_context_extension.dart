import 'package:flutter/material.dart';
import 'package:skybase/config/themes/app_typography.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  bool get isDarkMode {
    final brightness = Theme.of(this).brightness;
    return brightness == Brightness.dark;
  }

  AppTypography get typography => Theme.of(this).extension<AppTypography>()!;

  TextTheme get textTheme => Theme.of(this).textTheme;
}

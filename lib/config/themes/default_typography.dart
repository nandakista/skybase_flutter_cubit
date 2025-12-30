import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Only several type of typography below is used on default Widget
/// - titleLarge    = AppBar.title, AlertDialog.title
/// - titleMedium   = ListTile.title
/// - bodyLarge     = TextField.inputText
/// - bodyMedium    = Text, ListTile.subtitle, AlertDialog.content
/// - bodySmall     = InputDecoration.label, InputDecoration.hint, InputDecoration.error
/// - labelLarge    = ElevatedButton, FilledButton, OutlinedButton, TextButton
/// - labelMedium   = Chip.label, Tooltip.message
///
/// For more information
/// See on https://m3.material.io/styles/typography/type-scale-tokens
class DefaultTypography {
  static TextStyle? displayLarge = TextStyle(
    fontSize: 57,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
    height: 1.12,
  );

  static TextStyle? displayMedium = TextStyle(
    fontSize: 45,
    fontWeight: FontWeight.w400,
    height: 1.16,
  );

  static TextStyle? displaySmall = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    height: 1.22,
  );

  static TextStyle? headlineLarge = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w400,
    height: 1.25,
  );

  static TextStyle? headlineMedium = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    height: 1.28,
  );

  static TextStyle? headlineSmall = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    height: 1.33,
  );

  /// Used on:
  /// - AppBar.title
  /// - AlertDialog.title
  static TextStyle? titleLarge = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    height: 1.27,
  );

  /// Used on:
  /// - ListTile.title
  static TextStyle? titleMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    height: 1.50,
  );

  static TextStyle? titleSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.10,
    height: 1.43,
  );

  /// Used on:
  /// - TextField.inputText
  static TextStyle? bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.50,
    letterSpacing: 0.50,
  );

  /// Used on:
  /// - Text
  /// - ListTile.subtitle
  /// - AlertDialog.content
  static TextStyle? bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.43,
    letterSpacing: 0.25,
  );

  /// Used on:
  /// - InputDecoration.label
  /// - InputDecoration.hint
  /// - InputDecoration.error
  static TextStyle? bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.33,
    letterSpacing: 0.40,
  );

  /// Used on:
  /// - ElevatedButton
  /// - FilledButton
  /// - OutlinedButton
  /// - TextButton
  static TextStyle? labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.43,
    letterSpacing: 1.25,
  );

  /// Used on:
  /// - Chip.label
  /// - Tooltip.message
  static TextStyle? labelMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.33,
    letterSpacing: 0.50,
  );

  static TextStyle? labelSmall = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 1.27,
    letterSpacing: 0.50,
  );
}

import 'package:flutter/material.dart';
import 'package:skybase/config/themes/default_typography.dart';

/// Custom typography when the style is not provided or more than [DefaultTypography]
///
/// Add here to more style..
@immutable
class AppTypography extends ThemeExtension<AppTypography> {
  final TextStyle headline1;
  final TextStyle headline2;
  final TextStyle headline3;
  final TextStyle headline4;
  final TextStyle title1;
  final TextStyle title2;
  final TextStyle title3;
  final TextStyle title4;

  final TextStyle subtitle1;
  final TextStyle subtitle2;
  final TextStyle subtitle3;
  final TextStyle subtitle4;

  final TextStyle body1;
  final TextStyle body2;
  final TextStyle body3;
  final TextStyle small;
  final TextStyle verySmall;

  final TextStyle link;

  const AppTypography({
    required this.headline1,
    required this.headline2,
    required this.headline3,
    required this.headline4,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.title4,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle3,
    required this.subtitle4,
    required this.body1,
    required this.body2,
    required this.body3,
    required this.small,
    required this.verySmall,
    required this.link,
  });

  @override
  AppTypography copyWith({
    TextStyle? headline1,
    TextStyle? headline2,
    TextStyle? headline3,
    TextStyle? headline4,
    TextStyle? title1,
    TextStyle? title2,
    TextStyle? title3,
    TextStyle? title4,
    TextStyle? subtitle1,
    TextStyle? subtitle2,
    TextStyle? subtitle3,
    TextStyle? subtitle4,
    TextStyle? body1,
    TextStyle? body2,
    TextStyle? body3,
    TextStyle? small,
    TextStyle? verySmall,
    TextStyle? link,
  }) {
    return AppTypography(
      headline1: headline1 ?? this.headline1,
      headline2: headline2 ?? this.headline2,
      headline3: headline3 ?? this.headline3,
      headline4: headline4 ?? this.headline4,
      title1: title1 ?? this.title1,
      title2: title2 ?? this.title2,
      title3: title3 ?? this.title3,
      title4: title4 ?? this.title4,
      subtitle1: subtitle1 ?? this.subtitle1,
      subtitle2: subtitle2 ?? this.subtitle2,
      subtitle3: subtitle3 ?? this.subtitle3,
      subtitle4: subtitle4 ?? this.subtitle4,
      body1: body1 ?? this.body1,
      body2: body2 ?? this.body2,
      body3: body3 ?? this.body3,
      small: small ?? this.small,
      verySmall: verySmall ?? this.verySmall,
      link: link ?? this.link,
    );
  }

  @override
  AppTypography lerp(
      ThemeExtension<AppTypography>? other,
      double t,
      ) {
    if (other is! AppTypography) return this;
    return AppTypography(
      headline1: TextStyle.lerp(headline1, other.headline1, t)!,
      headline2: TextStyle.lerp(headline2, other.headline2, t)!,
      headline3: TextStyle.lerp(headline3, other.headline3, t)!,
      headline4: TextStyle.lerp(headline4, other.headline4, t)!,
      title1: TextStyle.lerp(title1, other.title1, t)!,
      title2: TextStyle.lerp(title2, other.title2, t)!,
      title3: TextStyle.lerp(title3, other.title3, t)!,
      title4: TextStyle.lerp(title4, other.title4, t)!,
      subtitle1: TextStyle.lerp(subtitle1, other.subtitle1, t)!,
      subtitle2: TextStyle.lerp(subtitle2, other.subtitle2, t)!,
      subtitle3: TextStyle.lerp(subtitle3, other.subtitle3, t)!,
      subtitle4: TextStyle.lerp(subtitle4, other.subtitle4, t)!,
      body1: TextStyle.lerp(body1, other.body1, t)!,
      body2: TextStyle.lerp(body2, other.body2, t)!,
      body3: TextStyle.lerp(body3, other.body3, t)!,
      small: TextStyle.lerp(small, other.small, t)!,
      verySmall: TextStyle.lerp(verySmall, other.verySmall, t)!,
      link: TextStyle.lerp(link, other.link, t)!,
    );
  }
}

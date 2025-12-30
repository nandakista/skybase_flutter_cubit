// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $LibGen {
  const $LibGen();

  /// Directory path: lib/core
  $LibCoreGen get core => const $LibCoreGen();
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_failed.svg
  SvgGenImage get icFailed => const SvgGenImage('assets/icons/ic_failed.svg');

  /// File path: assets/icons/ic_fork.svg
  SvgGenImage get icFork => const SvgGenImage('assets/icons/ic_fork.svg');

  /// File path: assets/icons/ic_success.svg
  SvgGenImage get icSuccess => const SvgGenImage('assets/icons/ic_success.svg');

  /// File path: assets/icons/ic_warning.svg
  SvgGenImage get icWarning => const SvgGenImage('assets/icons/ic_warning.svg');

  /// List of all assets
  List<SvgGenImage> get values => [icFailed, icFork, icSuccess, icWarning];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/ic_failed.png
  AssetGenImage get icFailed =>
      const AssetGenImage('assets/images/ic_failed.png');

  /// File path: assets/images/ic_fork.svg
  SvgGenImage get icFork => const SvgGenImage('assets/images/ic_fork.svg');

  /// File path: assets/images/ic_success.png
  AssetGenImage get icSuccess =>
      const AssetGenImage('assets/images/ic_success.png');

  /// File path: assets/images/ic_warning.png
  AssetGenImage get icWarning =>
      const AssetGenImage('assets/images/ic_warning.png');

  /// File path: assets/images/img_empty.png
  AssetGenImage get imgEmpty =>
      const AssetGenImage('assets/images/img_empty.png');

  /// File path: assets/images/img_error.png
  AssetGenImage get imgError =>
      const AssetGenImage('assets/images/img_error.png');

  /// File path: assets/images/img_not_found.png
  AssetGenImage get imgNotFound =>
      const AssetGenImage('assets/images/img_not_found.png');

  /// File path: assets/images/img_placeholder_user.png
  AssetGenImage get imgPlaceholderUser =>
      const AssetGenImage('assets/images/img_placeholder_user.png');

  /// File path: assets/images/img_pv_1.png
  AssetGenImage get imgPv1 => const AssetGenImage('assets/images/img_pv_1.png');

  /// File path: assets/images/img_pv_2.png
  AssetGenImage get imgPv2 => const AssetGenImage('assets/images/img_pv_2.png');

  /// File path: assets/images/img_pv_3.png
  AssetGenImage get imgPv3 => const AssetGenImage('assets/images/img_pv_3.png');

  /// File path: assets/images/splash_branding_logo.png
  AssetGenImage get splashBrandingLogo =>
      const AssetGenImage('assets/images/splash_branding_logo.png');

  /// File path: assets/images/splash_logo.png
  AssetGenImage get splashLogo =>
      const AssetGenImage('assets/images/splash_logo.png');

  /// List of all assets
  List<dynamic> get values => [
    icFailed,
    icFork,
    icSuccess,
    icWarning,
    imgEmpty,
    imgError,
    imgNotFound,
    imgPlaceholderUser,
    imgPv1,
    imgPv2,
    imgPv3,
    splashBrandingLogo,
    splashLogo,
  ];
}

class $LibCoreGen {
  const $LibCoreGen();

  /// Directory path: lib/core/localization
  $LibCoreLocalizationGen get localization => const $LibCoreLocalizationGen();
}

class $LibCoreLocalizationGen {
  const $LibCoreLocalizationGen();

  /// Directory path: lib/core/localization/languages
  $LibCoreLocalizationLanguagesGen get languages =>
      const $LibCoreLocalizationLanguagesGen();
}

class $LibCoreLocalizationLanguagesGen {
  const $LibCoreLocalizationLanguagesGen();

  /// File path: lib/core/localization/languages/en.json
  String get en => 'lib/core/localization/languages/en.json';

  /// File path: lib/core/localization/languages/id.json
  String get id => 'lib/core/localization/languages/id.json';

  /// List of all assets
  List<String> get values => [en, id];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $LibGen lib = $LibGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

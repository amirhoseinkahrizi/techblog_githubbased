/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/bluepen.png
  AssetGenImage get bluepen => const AssetGenImage('assets/icons/bluepen.png');

  /// File path: assets/icons/hashtag.png
  AssetGenImage get hashtag => const AssetGenImage('assets/icons/hashtag.png');

  /// File path: assets/icons/home icon.png
  AssetGenImage get homeIcon =>
      const AssetGenImage('assets/icons/home icon.png');

  /// File path: assets/icons/microphoneIcons.svg
  String get microphoneIcons => 'assets/icons/microphoneIcons.svg';

  /// File path: assets/icons/podcast icons.png
  AssetGenImage get podcastIcons =>
      const AssetGenImage('assets/icons/podcast icons.png');

  /// File path: assets/icons/techBot.svg
  String get techBot => 'assets/icons/techBot.svg';

  /// File path: assets/icons/techbot_unhappy.svg
  String get techbotUnhappy => 'assets/icons/techbot_unhappy.svg';

  /// File path: assets/icons/user.png
  AssetGenImage get user => const AssetGenImage('assets/icons/user.png');

  /// File path: assets/icons/write.png
  AssetGenImage get write => const AssetGenImage('assets/icons/write.png');

  /// File path: assets/icons/writeIcons.svg
  String get writeIcons => 'assets/icons/writeIcons.svg';

  /// List of all assets
  List<dynamic> get values => [
        bluepen,
        hashtag,
        homeIcon,
        microphoneIcons,
        podcastIcons,
        techBot,
        techbotUnhappy,
        user,
        write,
        writeIcons
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Screenshot (1).png
  AssetGenImage get screenshot1 =>
      const AssetGenImage('assets/images/Screenshot (1).png');

  /// File path: assets/images/arrow down.png
  AssetGenImage get arrowDown =>
      const AssetGenImage('assets/images/arrow down.png');

  /// File path: assets/images/avatarscreen.png
  AssetGenImage get avatarscreen =>
      const AssetGenImage('assets/images/avatarscreen.png');

  /// File path: assets/images/db2.jpg
  AssetGenImage get db2 => const AssetGenImage('assets/images/db2.jpg');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/poster.png
  AssetGenImage get poster => const AssetGenImage('assets/images/poster.png');

  /// File path: assets/images/singleplaceholder.jpg
  AssetGenImage get singleplaceholder =>
      const AssetGenImage('assets/images/singleplaceholder.jpg');

  /// File path: assets/images/techblogbot.svg
  String get techblogbot => 'assets/images/techblogbot.svg';

  /// List of all assets
  List<dynamic> get values => [
        screenshot1,
        arrowDown,
        avatarscreen,
        db2,
        logo,
        poster,
        singleplaceholder,
        techblogbot
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

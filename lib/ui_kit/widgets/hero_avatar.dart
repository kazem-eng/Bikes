import 'package:flutter/material.dart';

import 'package:bike_catalog/constants/constants.dart';
import 'package:bike_catalog/theme/theme.dart';
import 'package:bike_catalog/ui_kit/ui_kit.dart';

enum HeroType {
  avatar,
  text,
  icon,
}

enum HeroSize {
  large,
  medium,
  small,
}

class HeroAvatar extends StatelessWidget {
  const HeroAvatar({
    required HeroType heroType,
    required HeroSize heroSize,
    String? imageAsset,
    String? imageURL,
    String? text,
    Icon? icon,
    Color? backgroundColor,
    Key? key,
  })  : assert(
          heroType != HeroType.avatar || imageAsset != null || imageURL != null,
          Api.heroException,
        ),
        _heroType = heroType,
        _heroSize = heroSize,
        _imageAsset = imageAsset,
        _imageURL = imageURL,
        _icon = icon,
        _text = text,
        _backgroundColor = backgroundColor,
        super(key: key);

  factory HeroAvatar.smallImage({
    String? imageAsset,
    String? imageURL,
    Color? backgroundColor,
  }) =>
      HeroAvatar(
        heroType: HeroType.avatar,
        heroSize: HeroSize.medium,
        imageAsset: imageAsset,
        imageURL: imageURL,
        backgroundColor: backgroundColor,
      );

  factory HeroAvatar.largeImage({
    String? imageAsset,
    String? imageURL,
    Color? backgroundColor,
  }) =>
      HeroAvatar(
        heroType: HeroType.avatar,
        heroSize: HeroSize.large,
        imageAsset: imageAsset,
        imageURL: imageURL,
        backgroundColor: backgroundColor,
      );

  factory HeroAvatar.smallText({
    String? text,
    Color? backgroundColor,
  }) =>
      HeroAvatar(
        heroType: HeroType.text,
        heroSize: HeroSize.small,
        text: text,
        backgroundColor: backgroundColor,
      );

  factory HeroAvatar.mediumText({
    String? text,
    Color? backgroundColor,
  }) =>
      HeroAvatar(
        heroType: HeroType.text,
        heroSize: HeroSize.medium,
        text: text,
        backgroundColor: backgroundColor,
      );

  factory HeroAvatar.largeText({
    String? text,
    Color? backgroundColor,
  }) =>
      HeroAvatar(
        heroType: HeroType.text,
        heroSize: HeroSize.large,
        text: text,
        backgroundColor: backgroundColor,
      );

  factory HeroAvatar.smallIcon({
    required Icon icon,
    Color? backgroundColor,
  }) =>
      HeroAvatar(
        heroType: HeroType.icon,
        heroSize: HeroSize.small,
        icon: icon,
        backgroundColor: backgroundColor,
      );

  final String? _imageAsset;
  final String? _imageURL;
  final String? _text;
  final Icon? _icon;
  final Color? _backgroundColor;
  final HeroType _heroType;
  final HeroSize _heroSize;

  static const _largeSize = 74.0;
  static const _mediumSize = 40.0;
  static const _smallSize = 15.0;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;

    return SizedBox(
      height: _specifySize(),
      width: _specifySize(),
      child: CircleAvatar(
        child: _buildChild(appTheme),
        backgroundImage: _builHeroAvatar(appTheme),
        backgroundColor:
            _backgroundColor ?? appTheme.colors.disabledPrimaryBackground,
      ),
    );
  }

  Widget _builHeroText(IAppThemeData appTheme) => Label(
        _buildLabel(text: _text ?? ''),
        typography: _heroSize == HeroSize.medium
            ? TypographyFamily.headline7
            : TypographyFamily.caption,
        color: appTheme.colors.secondaryText,
      );

  Widget? _buildChild(IAppThemeData appTheme) {
    switch (_heroType) {
      case HeroType.text:
        return _builHeroText(appTheme);
      case HeroType.icon:
        return Center(child: _icon!);
      case HeroType.avatar:
        return Center(child: _icon!);
    }
  }

  ImageProvider<Object>? _builHeroAvatar(IAppThemeData appTheme) {
    if (_heroType == HeroType.avatar && _imageAsset != null) {
      return AssetImage(_imageAsset!);
    } else if (_heroType == HeroType.avatar && _imageURL != null) {
      return NetworkImage(_imageURL!);
    } else {
      return const NetworkImage('');
    }
  }

  double _specifySize() {
    switch (_heroSize) {
      case HeroSize.large:
        return _largeSize;
      case HeroSize.medium:
        return _mediumSize;
      case HeroSize.small:
        return _smallSize;
    }
  }

  String _buildLabel({required String text}) {
    final trimed = text.trim();
    if (trimed.isNotEmpty) {
      final splittedText = trimed.split(' ');
      final hasMultiplePart = splittedText.length > 1;
      return '${splittedText[0][0].toUpperCase()}${hasMultiplePart ? '.${splittedText[1][0].toUpperCase()}' : ''}';
    } else {
      return '';
    }
  }
}

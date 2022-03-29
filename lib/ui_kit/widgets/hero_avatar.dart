import 'package:flutter/material.dart';

import 'package:bikes/theme/theme.dart';
import 'package:bikes/ui_kit/ui_kit.dart';

enum HeroSize {
  large,
  medium,
  small,
}

class HeroAvatar extends StatelessWidget {
  const HeroAvatar({
    required HeroSize heroSize,
    String? text,
    Color? backgroundColor,
    Key? key,
  })  : _heroSize = heroSize,
        _text = text,
        _backgroundColor = backgroundColor,
        super(key: key);

  factory HeroAvatar.smallText({
    String? text,
    Color? backgroundColor,
  }) =>
      HeroAvatar(
        heroSize: HeroSize.small,
        text: text,
        backgroundColor: backgroundColor,
      );

  factory HeroAvatar.mediumText({
    String? text,
    Color? backgroundColor,
  }) =>
      HeroAvatar(
        heroSize: HeroSize.medium,
        text: text,
        backgroundColor: backgroundColor,
      );

  factory HeroAvatar.largeText({
    String? text,
    Color? backgroundColor,
  }) =>
      HeroAvatar(
        heroSize: HeroSize.large,
        text: text,
        backgroundColor: backgroundColor,
      );

  final String? _text;
  final Color? _backgroundColor;
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
        child: _builHeroText(appTheme),
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

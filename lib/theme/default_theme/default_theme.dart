import 'package:bike_catalog/theme/theme.dart';
import 'package:flutter/material.dart';

part 'colors.dart';
part 'typographies.dart';

class DefaultTheme extends IAppThemeData {
  static const _defaultBorderRadius = 8.0;

  @override
  ITypographies get typographies => const _Typographies();

  @override
  IColors get colors => const _Colors();

  @override
  ThemeData get mainTheme => ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

  @override
  BorderRadius get defaultBorderRadius =>
      BorderRadius.circular(_defaultBorderRadius);

  // card
  @override
  BoxDecoration get cardDecoration => BoxDecoration(
        color: colors.secondaryBackground,
        borderRadius: BorderRadius.circular(_defaultBorderRadius),
        border: Border.all(color: colors.primaryBorder),
      );

  @override
  TextStyle get cardDescriptionTextStyle =>
      _Typographies._robotoTypography.body1
          .copyWith(color: colors.foregroundColor);

  @override
  TextStyle get cardSubtitleTextStyle => _Typographies._robotoTypography.body1
      .copyWith(color: colors.disabledPrimaryBackground);

  @override
  TextStyle get cardTitleTextStyle => _Typographies._robotoTypography.headline1;
}

import 'package:flutter/material.dart';

part 'colors.dart';
part 'typographies.dart';

abstract class IAppThemeData {
  ThemeData get mainTheme;
  ITypographies get typographies;
  IColors get colors;

  BorderRadius get defaultBorderRadius;

  // card
  BoxDecoration get cardDecoration;
  TextStyle get cardTitleTextStyle;
  TextStyle get cardSubtitleTextStyle;
  TextStyle get cardDescriptionTextStyle;

  TextStyle getTextStyle({
    FontFamily fontFamily = FontFamily.roboto,
    TypographyStyle typographyFamily = TypographyStyle.body1,
    Color? color,
  }) {
    var style = typographies
        .byFontFamily(fontFamily)
        .byTypographyFamily(typographyFamily);

    if (color != null) {
      style = style.copyWith(color: color);
    }

    return style;
  }
}

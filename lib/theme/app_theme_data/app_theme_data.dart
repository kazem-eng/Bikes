import 'package:flutter/material.dart';

part 'colors.dart';
part 'typographies.dart';

abstract class IAppThemeData {
  ThemeData get mainTheme;
  ITypographies get typographies;
  IColors get colors;

  BorderRadius get defaultBorderRadius;
  InputBorder get inputBorder;

  // Buttons
  ButtonStyle get filledButtonStyle;
  ButtonStyle get disabledFilledButtonStyle;
  ButtonStyle get outlinedButtonStyle;
  ButtonStyle get disabledOutlinedButtonStyle;
  ButtonStyle get plainButtonStyle;
  ButtonStyle get disabledPlainButtonStyle;

  // card
  BoxDecoration get cardDecoration;

  // Dialog
  ShapeBorder get dialogShapeBorder;
  Decoration get dialogHeaderPrimaryDecoration;
  Decoration get dialogHeaderErrorDecoration;

  TextStyle getTextStyle({
    FontFamily fontFamily = FontFamily.roboto,
    TypographyFamily typographyFamily = TypographyFamily.body1,
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

  Map<String, Color> get nameToColor => {
        'red': Colors.red,
        'blue': Colors.blue,
        'white': Colors.white,
        'green': Colors.green,
        'black': Colors.black,
        'yellow': Colors.yellow,
        'grey': Colors.grey,
        'orange': Colors.orange,
      };
}

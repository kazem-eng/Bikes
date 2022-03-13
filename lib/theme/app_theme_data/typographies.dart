part of 'app_theme_data.dart';

enum TypographyFamily {
  headline1,
  headline2,
  headline3,
  headline4,
  headline5,
  headline6,
  headline7,
  subtitle1,
  subtitle2,
  body1,
  body2,
  button,
  caption,
  overLine,
}

enum FontFamily { roboto }

abstract class ITypographies {
  const ITypographies();

  ITypography byFontFamily([
    FontFamily fontFamily,
  ]);

  ITypography get robotoFontFamily;
}

abstract class ITypography {
  const ITypography();

  TextStyle get headline4;
  TextStyle get headline5;
  TextStyle get headline6;
  TextStyle get headline7;
  TextStyle get subtitle1;
  TextStyle get body1;
  TextStyle get body2;
  TextStyle get button;
  TextStyle get caption;

  TextStyle byTypographyFamily(TypographyFamily? typographyFamily) {
    switch (typographyFamily) {
      case TypographyFamily.headline4:
        return headline4;
      case TypographyFamily.headline5:
        return headline5;
      case TypographyFamily.headline6:
        return headline6;
      case TypographyFamily.headline7:
        return headline7;
      case TypographyFamily.subtitle1:
        return subtitle1;
      case TypographyFamily.body1:
        return body1;
      case TypographyFamily.body2:
        return body2;
      case TypographyFamily.button:
        return button;
      case TypographyFamily.caption:
        return caption;

      default:
        return body1;
    }
  }
}

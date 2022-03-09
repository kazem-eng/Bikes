part of 'app_theme_data.dart';

enum TypographyStyle {
  headline1,
  body1,
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

  TextStyle get headline1;
  TextStyle get body1;

  TextStyle byTypographyFamily(TypographyStyle? typographyFamily) {
    switch (typographyFamily) {
      case TypographyStyle.headline1:
        return headline1;
      default:
        return body1;
    }
  }
}

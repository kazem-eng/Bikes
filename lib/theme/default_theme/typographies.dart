part of 'default_theme.dart';

class _Typographies extends ITypographies {
  const _Typographies();

  static const _RobotoTypography _robotoTypography = _RobotoTypography();

  @override
  ITypography byFontFamily([
    FontFamily? fontFamily,
  ]) {
    switch (fontFamily) {
      default:
        return _robotoTypography;
    }
  }

  @override
  ITypography get robotoFontFamily => _robotoTypography;
}

class _RobotoTypography extends ITypography {
  const _RobotoTypography();

  static const String robotoFontFamily = 'Roboto';
  static const _h1HeadlineSize = 10.0;
  static const _body1 = 16.0;

  static const _defaultTextColor = _IColors.black;
  static const _body1LetterSpacing = 0.27;

  TextStyle get _baseTextStyle => const TextStyle(
        fontFamily: robotoFontFamily,
        fontWeight: FontWeight.w400,
        fontSize: _body1,
        color: _defaultTextColor,
      );

  @override
  TextStyle get headline1 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: _h1HeadlineSize,
      );

  @override
  TextStyle get body1 => _baseTextStyle.copyWith(
        letterSpacing: _body1LetterSpacing,
      );
}

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
  static const _h4HeadlineSize = 34.0;
  static const _h5HeadlineSize = 30.0;
  static const _h6HeadlineSize = 24.0;
  static const _h7HeadlineSize = 20.0;
  static const _subtitle1 = 16.0;
  static const _body1 = 16.0;
  static const _body2 = 14.0;
  static const _button = 14.0;
  static const _caption = 12.0;
  static const _defaultTextColor = _IColors.black;
  static const _h6HeadlineLetterSpacing = 0.18;
  static const _h7HeadlineLetterSpacing = 0.15;
  static const _subtitle1LetterSpacing = 0.08;
  static const _buttonLetterSpacing = 0.80;
  static const _body1LetterSpacing = 0.27;
  static const _body2LetterSpacing = 0.24;
  static const _captionLetterSpacing = 0.36;

  TextStyle get _baseTextStyle => const TextStyle(
        fontFamily: robotoFontFamily,
        fontWeight: FontWeight.w400,
        fontSize: _body1,
        color: _defaultTextColor,
      );

  @override
  TextStyle get headline4 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: _h4HeadlineSize,
      );

  @override
  TextStyle get headline5 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: _h5HeadlineSize,
      );

  @override
  TextStyle get headline6 => _baseTextStyle.copyWith(
        fontSize: _h6HeadlineSize,
        letterSpacing: _h6HeadlineLetterSpacing,
      );

  @override
  TextStyle get headline7 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: _h7HeadlineSize,
        letterSpacing: _h7HeadlineLetterSpacing,
      );

  @override
  TextStyle get subtitle1 => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: _subtitle1,
        letterSpacing: _subtitle1LetterSpacing,
      );

  @override
  TextStyle get body1 => _baseTextStyle.copyWith(
        letterSpacing: _body1LetterSpacing,
      );

  @override
  TextStyle get body2 => _baseTextStyle.copyWith(
        fontSize: _body2,
        letterSpacing: _body2LetterSpacing,
        color: _IColors.grey04,
        height: 1.5,
      );

  @override
  TextStyle get button => _baseTextStyle.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: _button,
        letterSpacing: _buttonLetterSpacing,
      );

  @override
  TextStyle get caption => _baseTextStyle.copyWith(
        fontSize: _caption,
        letterSpacing: _captionLetterSpacing,
        color: _IColors.grey04,
      );
}

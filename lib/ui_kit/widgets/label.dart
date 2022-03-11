import 'package:flutter/material.dart';

import 'package:bike_catalog/theme/theme.dart';

class Label extends StatelessWidget {
  const Label(
    String text, {
    FontFamily fontFamily = FontFamily.roboto,
    TypographyFamily typography = TypographyFamily.body1,
    int maxline = 1,
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    Key? key,
  })  : _text = text,
        _typography = typography,
        _fontFamily = fontFamily,
        _color = color,
        _style = style,
        _maxline = maxline,
        _textAlign = textAlign,
        super(key: key);

  final String _text;
  final FontFamily _fontFamily;
  final TypographyFamily _typography;
  final Color? _color;
  final TextStyle? _style;
  final TextAlign? _textAlign;
  final int _maxline;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    final defaultStyle = appTheme.getTextStyle(
      fontFamily: _fontFamily,
      typographyFamily: _typography,
      color: _color,
    );
    return Text(
      _text,
      style: _style ?? defaultStyle,
      overflow: TextOverflow.ellipsis,
      textAlign: _textAlign,
      maxLines: _maxline,
    );
  }
}

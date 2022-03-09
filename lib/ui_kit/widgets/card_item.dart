import 'package:flutter/material.dart';

import 'package:bike_catalog/theme/theme.dart';
import 'package:bike_catalog/ui_kit/ui_kit.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    required String title,
    required String subtitle,
    Color? bgColor,
    Key? key,
  })  : _title = title,
        _subtitle = subtitle,
        _bgColor = bgColor,
        super(key: key);

  final String _title;
  final String _subtitle;
  final Color? _bgColor;

  static const _cardMargin = 10.0;
  static const _cardPadding = 5.0;
  static const _cardElevation = 2.0;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return Card(
      elevation: _cardElevation,
      margin: const EdgeInsets.all(_cardMargin),
      color: _bgColor,
      child: ListTile(
        contentPadding: const EdgeInsets.all(_cardPadding),
        horizontalTitleGap: _cardPadding,
        leading: const CircleAvatar(),
        title: Label(
          _title,
          typography: TypographyStyle.headline1,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: _cardPadding),
          child: Label(
            _subtitle,
            color: appTheme.colors.subtitleText,
          ),
        ),
      ),
    );
  }
}

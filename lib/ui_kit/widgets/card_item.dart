import 'package:flutter/material.dart';

import 'package:bike_catalog/theme/theme.dart';
import 'package:bike_catalog/ui_kit/ui_kit.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    required String title,
    required String subtitle,
    Function()? onTap,
    String? imageURL,
    Key? key,
  })  : _title = title,
        _subtitle = subtitle,
        _onTap = onTap,
        _imageURL = imageURL,
        super(key: key);

  final String _title;
  final String _subtitle;
  final String? _imageURL;
  final Function()? _onTap;

  static const _cardMargin = 10.0;
  static const _cardHeight = 320.0;
  static const _footerHeight = 60.0;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return InkWell(
      onTap: _onTap,
      child: SizedBox(
        height: _cardHeight,
        child: Container(
          margin: const EdgeInsets.all(_cardMargin),
          decoration: appTheme.cardDecoration,
          child: ClipRRect(
            borderRadius: appTheme.defaultBorderRadius,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network(
                  _imageURL ?? 'https://picsum.photos/id/237/300/200',
                  fit: BoxFit.cover,
                ),
                Expanded(
                  child: Container(
                    height: _footerHeight,
                    padding: const EdgeInsets.only(bottom: _cardMargin),
                    child: ListTile(
                        title: Label(
                          _title,
                        ),
                        subtitle: Label(
                          _subtitle,
                        ),
                        trailing: const Icon(Icons.keyboard_arrow_right)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

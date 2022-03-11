import 'package:bike_catalog/constants/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:bike_catalog/theme/theme.dart';
import 'package:bike_catalog/ui_kit/ui_kit.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    required String title,
    required String subtitle,
    Function()? onTap,
    String? imageURL,
    String? titleSuffix,
    Widget? trailingWidget,
    Widget? addOnIcon,
    Key? key,
  })  : _title = title,
        _subtitle = subtitle,
        _onTap = onTap,
        _imageURL = imageURL,
        _titleSuffix = titleSuffix,
        _trailingWidget = trailingWidget,
        _addOnIcon = addOnIcon,
        super(key: key);

  final String _title;
  final String? _titleSuffix;
  final String _subtitle;
  final String? _imageURL;
  final Function()? _onTap;
  final Widget? _trailingWidget;
  final Widget? _addOnIcon;

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
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CachedNetworkImage(
                          imageUrl: _imageURL ?? Api.placeholederURL,
                          placeholder: (context, url) => Image.asset(
                            Resources.bikePlaceHolder,
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: _footerHeight,
                        color: appTheme.colors.secondaryLight.withOpacity(0.5),
                        padding: const EdgeInsets.only(bottom: _cardMargin),
                        child: ListTile(
                          title: Label(
                            _title,
                            typography: TypographyFamily.caption,
                          ),
                          subtitle: Label(
                            _subtitle,
                          ),
                          trailing: _trailingWidget ??
                              const Icon(Icons.keyboard_arrow_right),
                        ),
                      ),
                    ),
                  ],
                ),
                _addOnIcon ?? Container(),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 6),
                    child: Label(
                      _titleSuffix ?? '',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 131, 131, 131)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

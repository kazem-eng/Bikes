import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:bikes/constants/constants.dart';
import 'package:bikes/theme/theme.dart';
import 'package:bikes/ui_kit/ui_kit.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    required String title,
    required String subtitle,
    Function()? onTap,
    String? imageURL,
    String? titleSuffix,
    String? subtitlePrefix,
    String? subtitlePostfix,
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
        _subtitlePrefix = subtitlePrefix,
        _subtitlePostfix = subtitlePostfix,
        super(key: key);

  final String _title;
  final String? _titleSuffix;
  final String _subtitle;
  final String? _subtitlePrefix;
  final String? _subtitlePostfix;
  final String? _imageURL;
  final Function()? _onTap;
  final Widget? _trailingWidget;
  final Widget? _addOnIcon;

  static const _cardMargin = 10.0;
  static const _cardHeight = 320.0;
  static const _footerHeight = 60.0;
  static const _imagepadding = 20.0;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return InkWell(
      onTap: _onTap,
      child: _buildCardContainer(appTheme),
    );
  }

  Widget _buildCardContainer(IAppThemeData appTheme) => SizedBox(
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
                    _buildCardImage(),
                    _buildCardfooter(appTheme),
                  ],
                ),
                _addOnIcon ?? Container(),
                _buildTitleSuffix(appTheme),
              ],
            ),
          ),
        ),
      );

  Widget _buildCardImage() => Expanded(
        flex: 6,
        child: Padding(
          padding: const EdgeInsets.all(_imagepadding),
          child: CachedNetworkImage(
            imageUrl: _imageURL ?? Api.placeholederURL,
            placeholder: (context, url) => Image.asset(
              Resources.bikePlaceHolder,
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      );

  Widget _buildCardfooter(IAppThemeData appTheme) => Expanded(
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
            subtitle: _subtitlePrefix != null
                ? Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      HeroAvatar.smallText(text: _subtitlePrefix),
                      const SizedBox(width: 5),
                      Label(_subtitle),
                      Label(
                        ' - $_subtitlePostfix',
                        style: appTheme.typographies.robotoFontFamily.button
                            .copyWith(
                          color: appTheme.colors.subtitleText,
                        ),
                      ),
                    ],
                  )
                : Label(_subtitle),
            trailing: _trailingWidget ?? const Icon(Icons.keyboard_arrow_right),
          ),
        ),
      );

  Widget _buildTitleSuffix(IAppThemeData appTheme) => Align(
        alignment: Alignment.topRight,
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 4.0,
            horizontal: 6,
          ),
          child: Label(
            _titleSuffix ?? '',
            style: TextStyle(color: appTheme.colors.defaultBorder),
          ),
        ),
      );
}

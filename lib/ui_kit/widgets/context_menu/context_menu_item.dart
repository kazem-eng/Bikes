part of 'context_menu.dart';

class _ContextMenuItem extends StatefulWidget {
  const _ContextMenuItem({
    IconData? icon,
    String? title,
    String? subtitle,
    Function()? onTap,
    Key? key,
  })  : _icon = icon,
        _title = title,
        _subtitle = subtitle,
        _onTap = onTap,
        super(key: key);

  final IconData? _icon;
  final String? _title;
  final String? _subtitle;
  final Function()? _onTap;

  static const _listTilePadding = 14.0;
  static const _titleVerticalPadding = 4.0;

  @override
  _ContextMenuItemState createState() => _ContextMenuItemState();
}

class _ContextMenuItemState extends State<_ContextMenuItem> {
  @override
  Widget build(BuildContext context) {
    final apptheme = AppTheme.of(context).theme;
    final titleColor = apptheme.colors.foregroundColor;
    final subtitleColor = apptheme.colors.subtitleText;

    return _buildContentWidget(
      icon: widget._icon,
      title: widget._title,
      subtitle: widget._subtitle,
      titleColor: titleColor,
      subtitleColor: subtitleColor,
      onTap: widget._onTap,
    );
  }

  Widget _buildContentWidget({
    IconData? icon,
    String? title,
    String? subtitle,
    Color? titleColor,
    Color? subtitleColor,
    Function()? onTap,
  }) {
    assert(
      icon != null || title != null,
      Api.contextMenuException,
    );
    final hasText = title != null || subtitle != null;
    final iconRightPadding = hasText ? _ContextMenuItem._listTilePadding : 0.0;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: _ContextMenuItem._listTilePadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: iconRightPadding),
            child: icon != null
                ? Icon(
                    icon,
                    color: titleColor,
                  )
                : null,
          ),
          if (hasText)
            _buildTextSection(
              title: title,
              titleColor: titleColor,
              subtitle: subtitle,
              subtitleColor: subtitleColor,
            )
        ],
      ),
    );
  }

  Widget _buildTextSection({
    String? title,
    String? subtitle,
    Color? titleColor,
    Color? subtitleColor,
  }) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: _ContextMenuItem._titleVerticalPadding,
              ),
              child: Label(
                title,
                typography: TypographyFamily.subtitle1,
                color: titleColor,
              ),
            ),
          if (subtitle != null)
            Label(
              subtitle,
              typography: TypographyFamily.body2,
              color: subtitleColor,
            ),
        ],
      ),
    );
  }
}

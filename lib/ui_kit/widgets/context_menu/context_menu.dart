import 'package:bike_catalog/theme/theme.dart';
import 'package:bike_catalog/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

part 'context_menu_divider.dart';
part 'context_menu_item.dart';

class ContextMenu extends StatelessWidget {
  const ContextMenu({
    required List<ContextMenuAction> actions,
    Icon? icon,
    Key? key,
  })  : _actions = actions,
        _icon = icon,
        super(key: key);

  final List<ContextMenuAction> _actions;
  final Icon? _icon;
  static const _menuItemHorizontalPadding = 18.0;
  static const _menuMargin = 10.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: _menuMargin),
      padding: const EdgeInsets.all(8.0),
      child: PopupMenuButton(
        child: _icon ?? const Icon(Icons.more_vert),
        itemBuilder: (_) {
          return _buildItemList();
        },
        onSelected: (value) {
          final index = value as int;
          _actions[index].onTap?.call();
        },
      ),
    );
  }

  List<PopupMenuEntry<int>> _buildItemList() {
    final list = <PopupMenuEntry<int>>[];
    for (var action in _actions) {
      final index = _actions.indexOf(action);
      list.add(
        PopupMenuItem(
          padding: const EdgeInsets.symmetric(
              horizontal: _menuItemHorizontalPadding),
          value: index,
          child: _ContextMenuItem(
            icon: action.icon,
            title: action.title,
            subtitle: action.subtitle,
            onTap: action.onTap,
          ),
        ),
      );
      if (index < _actions.length - 1) {
        list.add(
          const _ContextMenuDivider(),
        );
      }
    }
    return list;
  }
}

class ContextMenuAction {
  ContextMenuAction({
    this.icon,
    this.title,
    this.subtitle,
    this.onTap,
  }) : assert(icon != null || title != null,
            'Either icon or title should be provided');

  final String? title;
  final String? subtitle;
  final IconData? icon;
  final Function()? onTap;
}

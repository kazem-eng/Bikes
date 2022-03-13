import 'package:flutter/material.dart';

import 'package:bike_catalog/constants/constants.dart';
import 'package:bike_catalog/theme/theme.dart';
import 'package:bike_catalog/ui_kit/ui_kit.dart';

part 'context_menu_divider.dart';
part 'context_menu_item.dart';

class ContextMenu extends StatelessWidget {
  const ContextMenu({
    required List<ContextMenuAction> actions,
    Icon? icon,
    String? title,
    Key? key,
  })  : _actions = actions,
        _icon = icon,
        _title = title,
        super(key: key);

  final List<ContextMenuAction> _actions;
  final Icon? _icon;
  final String? _title;

  static const _menuItemHorizontalPadding = 18.0;
  static const _menuMargin = 10.0;
  static const _menuPadding = 8.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: _menuMargin),
      padding: const EdgeInsets.all(_menuPadding),
      child: PopupMenuButton(
        child: Row(
          children: [
            Label(_title ?? ''),
            const SizedBox(
              width: _menuPadding,
            ),
            _icon ?? const Icon(Icons.more_vert),
          ],
        ),
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
  }) : assert(
          icon != null || title != null,
          Api.contextMenuException,
        );

  final String? title;
  final String? subtitle;
  final IconData? icon;
  final Function()? onTap;
}

part of 'context_menu.dart';

class _ContextMenuDivider extends PopupMenuDivider {
  const _ContextMenuDivider({Key? key}) : super(key: key);

  static const _menuDividerPadding = 15.0;
  static const _menuDividerHeight = 0.0;

  @override
  _ExtoContextMenuDividerState createState() => _ExtoContextMenuDividerState();
}

class _ExtoContextMenuDividerState extends State<_ContextMenuDivider> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: _ContextMenuDivider._menuDividerPadding,
      ),
      child: LineDivider.horizontal(
        height: _ContextMenuDivider._menuDividerHeight,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:bike_catalog/theme/theme.dart';
import 'package:bike_catalog/ui_kit/ui_kit.dart';

class ReactiveChip extends StatefulWidget {
  const ReactiveChip({
    required String label,
    void Function(bool)? onSelected,
    bool? isSelected,
    Key? key,
  })  : _label = label,
        _isSelected = isSelected,
        _onSelected = onSelected,
        super(key: key);

  final String _label;
  final bool? _isSelected;
  final void Function(bool)? _onSelected;

  @override
  State<ReactiveChip> createState() => _ReactiveChipState();
}

class _ReactiveChipState extends State<ReactiveChip> {
  late bool isSelected;

  @override
  void initState() {
    isSelected = widget._isSelected ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return InputChip(
      onSelected: (value) {
        setState(() {
          isSelected = value;
        });
        widget._onSelected?.call(value);
      },
      selectedColor: appTheme.colors.successLabel,
      selected: isSelected,
      label: Label(
        widget._label,
        style: TextStyle(
          color: isSelected
              ? appTheme.colors.secondaryBackground
              : appTheme.colors.defaultText,
        ),
      ),
    );
  }
}

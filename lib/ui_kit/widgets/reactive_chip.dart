import 'package:bike_catalog/theme/theme.dart';
import 'package:bike_catalog/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class ReactiveChip extends StatefulWidget {
  const ReactiveChip({
    required String label,
    bool? isSelected,
    Key? key,
  })  : _label = label,
        _isSelected = isSelected,
        super(key: key);

  final String _label;
  final bool? _isSelected;

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
      },
      selectedColor: Colors.green,
      selected: isSelected,
      label: Label(
        widget._label,
        style: TextStyle(
            color: isSelected
                ? appTheme.colors.secondaryBackground
                : appTheme.colors.defaultText),
      ),
    );
  }
}

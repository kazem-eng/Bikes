import 'package:flutter/material.dart';

class CustomRangeSlider extends StatefulWidget {
  const CustomRangeSlider({
    required void Function(RangeValues)? onChanged,
    required double minRange,
    required double maxRange,
    required RangeValues rangeValues,
    int? divisions,
    Key? key,
  })  : _onChanged = onChanged,
        _minRange = minRange,
        _maxRange = maxRange,
        _rangeValues = rangeValues,
        _divisions = divisions,
        super(key: key);

  final double _minRange;
  final double _maxRange;
  final int? _divisions;
  final RangeValues _rangeValues;
  final void Function(RangeValues)? _onChanged;

  @override
  State<CustomRangeSlider> createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
  late RangeValues _rangeValue;

  @override
  void initState() {
    _rangeValue = widget._rangeValues;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      min: widget._minRange,
      max: widget._maxRange,
      divisions: widget._divisions,
      labels: RangeLabels(
        _rangeValue.start.toStringAsFixed(0),
        _rangeValue.end.toStringAsFixed(0),
      ),
      onChanged: (rangeValue) {
        setState(() {
          _rangeValue = rangeValue;
        });
        widget._onChanged?.call(_rangeValue);
      },
      values: _rangeValue,
    );
  }
}

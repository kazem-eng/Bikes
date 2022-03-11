import 'package:flutter/material.dart';

class CustomRangeSlider extends StatefulWidget {
  const CustomRangeSlider({Key? key}) : super(key: key);

  @override
  State<CustomRangeSlider> createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
  var rValues = RangeValues(0, 20000);
  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      max: 200000,
      divisions: 5000,
      labels: RangeLabels(rValues.start.toString(), rValues.end.toString()),
      onChanged: (rangeValue) {
        setState(() {
          rValues = rangeValue;
        });
      },
      values: rValues,
    );
  }
}

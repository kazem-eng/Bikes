import 'package:flutter/material.dart';

import 'package:bike_catalog/constants/constants.dart';
import 'package:bike_catalog/models/models.dart';
import 'package:bike_catalog/theme/theme.dart';
import 'package:bike_catalog/ui_kit/ui_kit.dart';

class FilterWidget extends StatelessWidget {
  FilterWidget({
    required BikeFilter filter,
    required void Function(BikeFilter filter)? onChange,
    Key? key,
  })  : _filter = filter,
        _onChange = onChange,
        super(key: key);

  final BikeFilter _filter;
  final void Function(BikeFilter filter)? _onChange;

  final _categoryChips = <Widget>[];
  final _sizeChips = <Widget>[];
  final _defaultMax = 10000.0;
  final _defaultDivision = 10000;

  @override
  Widget build(BuildContext context) {
    const _spacer = SizedBox(height: 20);
    _initiateSizeAndCategories();
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Label(
            Strings.categorySelection,
            typography: TypographyFamily.headline7,
          ),
          Wrap(
            children: [..._categoryChips],
          ),
          _spacer,
          const Label(
            Strings.priceSelection,
            typography: TypographyFamily.headline7,
          ),
          CustomRangeSlider(
            maxRange: _defaultMax,
            minRange: 0.0,
            rangeValues: _filter.prices,
            divisions: _defaultDivision,
            onChanged: (rangeValues) {
              final updateFilter = _filter.copyWith(prices: rangeValues);
              _onChange?.call(updateFilter);
            },
          ),
          _spacer,
          const Label(
            Strings.sizeSelection,
            typography: TypographyFamily.headline7,
          ),
          Wrap(
            children: [..._sizeChips],
          ),
          _spacer,
        ],
      ),
    );
  }

  void _initiateSizeAndCategories() {
    _categoryChips.clear();
    _sizeChips.clear();
    for (var category in BikeCategory.values) {
      _categoryChips.add(
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: ReactiveChip(
            label: category.name,
            isSelected: _filter.categories.contains(category),
            onSelected: (isSelected) {
              final newCategories = _filter.categories;
              isSelected
                  ? newCategories.add(category)
                  : newCategories.remove(category);

              final updateFilter = _filter.copyWith(categories: newCategories);
              _onChange?.call(updateFilter);
            },
          ),
        ),
      );
    }
    for (var size in BikeSize.values) {
      _sizeChips.add(
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: ReactiveChip(
            label: size.name,
            isSelected: _filter.sizes.contains(size),
            onSelected: (isSelected) {
              final newSizes = _filter.sizes;
              isSelected ? newSizes.add(size) : newSizes.remove(size);

              final updateFilter = _filter.copyWith(sizes: newSizes);
              _onChange?.call(updateFilter);
            },
          ),
        ),
      );
    }
  }
}

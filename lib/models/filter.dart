import 'package:flutter/material.dart';

import 'package:bike_catalog/models/bike_enums.dart';

class BikeFilter {
  BikeFilter({
    required this.categories,
    required this.sizes,
    required this.prices,
  });

  factory BikeFilter.empty() => BikeFilter(
        categories: {},
        sizes: {},
        prices: defaultRange,
      );

  BikeFilter copyWith({
    Set<BikeCategory>? categories,
    Set<BikeSize>? sizes,
    RangeValues? prices,
  }) {
    return BikeFilter(
      categories: categories ?? this.categories,
      sizes: sizes ?? this.sizes,
      prices: prices ?? this.prices,
    );
  }

  final Set<BikeCategory> categories;
  final Set<BikeSize> sizes;
  final RangeValues prices;

  static const defaultRange = RangeValues(0, 10000);

  bool get isEmpty {
    return categories.isEmpty && sizes.isEmpty && prices == defaultRange;
  }
}

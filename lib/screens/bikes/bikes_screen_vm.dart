import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import 'package:bikes/base/base.dart';
import 'package:bikes/constants/constants.dart';
import 'package:bikes/helpers/helpers.dart';
import 'package:bikes/models/models.dart';
import 'package:bikes/screens/bikes/bikes_screen_m.dart';
import 'package:bikes/services/services.dart';
import 'package:bikes/ui_kit/helpers/toaster_helper.dart';

@injectable
class BikesScreenViewModel extends BaseViewModel<BikesScreenState> {
  BikesScreenViewModel({
    required INavigationService navigation,
    required INetworkService network,
  })  : _network = network,
        _navigation = navigation,
        super(const Loading());

  final INetworkService _network;
  final INavigationService _navigation;

  Future<void> loadBikes(context) async {
    final bikes = <Bike>[];
    try {
      final response = await _network.get();
      Iterable bikesJson = jsonDecode(response.body);
      bikes.addAll(_convertBikesJson(bikesJson));
    } catch (error) {
      Toaster.showToast(
        context: context,
        toastType: ToastType.error,
        message: Api.noConnection,
        duration: const Duration(seconds: 10),
      );
      bikes.addAll(await _loadBikesJsonData());
    }
    emit(
      Loaded(
        bikes: bikes,
        filter: BikeFilter.empty(),
        filterMode: false,
        filteredBikes: bikes,
      ),
    );
  }

  void onBikeSelection({required Bike selectedBike}) {
    _navigation.navigateTo(route: DetailsRoute(bikeDetails: selectedBike));
  }

  Future<List<Bike>> _loadBikesJsonData() async {
    final jsonText = await rootBundle.loadString(Resources.bikesJson);
    Iterable bikesJson = jsonDecode(jsonText);
    return _convertBikesJson(bikesJson);
  }

  List<Bike> _convertBikesJson(Iterable<dynamic> bikesJson) {
    final bikes = <Bike>[];
    if (bikesJson.isNotEmpty) {
      for (var bike in bikesJson) {
        bikes.add(Bike.fromJson(bike));
      }
    }
    return bikes;
  }

  void sort({required BikeSortType sortType}) {
    var sortedBikes = <Bike>[];
    final currentState = state as Loaded;
    switch (sortType) {
      case BikeSortType.priceASC:
        sortedBikes = _getBikesFromState().sorted(
          (a, b) => b.price.compareTo(a.price),
        );
        break;
      case BikeSortType.priceDES:
        sortedBikes = _getBikesFromState().sorted(
          (a, b) => a.price.compareTo(b.price),
        );
        break;
      case BikeSortType.alphabetically:
        sortedBikes = _getBikesFromState().sorted(
          (a, b) => a.name.compareTo(b.name),
        );
        break;
    }
    if (currentState.filterMode) {
      emit(currentState.copyWith(filteredBikes: sortedBikes));
    } else {
      emit(currentState.copyWith(bikes: sortedBikes));
    }
  }

  void updateFilter(BikeFilter filter) {
    final currentState = state as Loaded;
    emit(
      currentState.copyWith(
        filter: filter,
        filterMode: !currentState.filter.isEmpty,
      ),
    );
  }

  void filterBikes() {
    final currentState = state as Loaded;
    if (currentState.filterMode) {
      final filteredBikes = [..._filterByCategory(currentState.filter)];
      final fileteredBySize = [..._filterBySize(currentState.filter)];
      final fileteredByPrice = [..._filterByPrice(currentState.filter)];

      filteredBikes.removeWhere((item) => !fileteredBySize.contains(item));
      filteredBikes.removeWhere((item) => !fileteredByPrice.contains(item));

      emit(currentState.copyWith(
        filteredBikes: filteredBikes,
        filterMode: true,
      ));
    } else {
      emit(currentState.copyWith(
        filterMode: false,
      ));
    }
  }

  List<Bike> _filterByCategory(BikeFilter filter) {
    final bikesToFilter = [...(state as Loaded).bikes];

    final catFilterStrings = <String>[];
    if (filter.categories.isNotEmpty) {
      for (var cat in filter.categories) {
        catFilterStrings.add(EnumHelpers.humanize(cat));
      }
    }
    return catFilterStrings.isNotEmpty
        ? bikesToFilter
            .where((bike) => catFilterStrings.contains(bike.category))
            .toList()
        : bikesToFilter;
  }

  List<Bike> _filterBySize(
    BikeFilter filter,
  ) {
    final sizeFilterStrings = <String>[];
    final bikesToFilter = [...(state as Loaded).bikes];
    if (filter.sizes.isNotEmpty) {
      for (var size in filter.sizes) {
        sizeFilterStrings.add(EnumHelpers.humanize(size));
      }
    }

    return sizeFilterStrings.isNotEmpty
        ? bikesToFilter
            .where((bike) => sizeFilterStrings.contains(bike.size))
            .toList()
        : bikesToFilter;
  }

  List<Bike> _filterByPrice(
    BikeFilter filter,
  ) {
    final list = [...(state as Loaded).bikes]
        .where((bike) =>
            filter.prices.start <= bike.price &&
            bike.price <= filter.prices.end)
        .toList();
    return list;
  }

  List<Bike> _getBikesFromState() => (state as Loaded).filterMode
      ? (state as Loaded).filteredBikes
      : (state as Loaded).bikes;
}

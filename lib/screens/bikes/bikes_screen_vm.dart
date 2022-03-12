import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import 'package:bike_catalog/base/base.dart';
import 'package:bike_catalog/constants/constants.dart';
import 'package:bike_catalog/helpers/enum_helper.dart';
import 'package:bike_catalog/helpers/list_helpers.dart';
import 'package:bike_catalog/models/bike.dart';
import 'package:bike_catalog/models/bike_enums.dart';
import 'package:bike_catalog/models/filter.dart';
import 'package:bike_catalog/screens/bikes/bikes_screen_m.dart';
import 'package:bike_catalog/services/navigation/navigation.dart';
import 'package:bike_catalog/services/network/network.dart';
import 'package:bike_catalog/ui_kit/helpers/toaster_helper.dart';

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
    emit(Loaded(
      bikes: bikes,
      filter: BikeFilter.empty(),
      filterMode: false,
      filteredBikes: bikes,
    ));
  }

  void onBikeSelection({required Bike selectedBike}) {
    _navigation.navigateTo(route: DetailsRoute(bikeDetails: selectedBike));
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

  Future<List<Bike>> _loadBikesJsonData() async {
    final jsonText = await rootBundle.loadString(Resources.bikesJson);
    Iterable bikesJson = jsonDecode(jsonText);
    return _convertBikesJson(bikesJson);
  }

  void search(String searchValue) {
    if (state is Loaded) {
      final loadedState = state as Loaded;
      emit(
        Search(
          bikes: loadedState.bikes,
          foundBikes: loadedState.bikes,
          filterMode: loadedState.filterMode,
          filteredBikes: loadedState.filteredBikes,
          filter: loadedState.filter,
          searchKey: searchValue,
        ),
      );
      _searchOperation(searchValue);
    } else {
      _searchOperation(searchValue);
    }
  }

  void _searchOperation(String searchValue) {
    if (searchValue.isNotEmpty) {
      final foundRecords = (state as Search)
          .bikes
          .where((element) =>
              element.name.toLowerCase().contains(searchValue.toLowerCase()))
          .toList();
      if (foundRecords.isNotEmpty) {
        emit((state as Search).copyWith(
          foundBikes: foundRecords,
          searchKey: searchValue,
        ));
      } else {
        emit((state as Search).copyWith(
          foundBikes: <Bike>[],
          searchKey: searchValue,
        ));
      }
    } else {
      emit(
        (state as Search).copyWith(
          bikes: (state as Search).bikes,
          foundBikes: (state as Search).bikes,
          searchKey: searchValue,
        ),
      );
    }
  }

  void sort({required BikeSortType sortType}) {
    var sortedBikes = <Bike>[];
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
      case BikeSortType.year:
        sortedBikes = _getBikesFromState().sorted(
          (a, b) => a.year.compareTo(b.year),
        );
        break;
    }
    state is Loaded
        ? emit((state as Loaded).copyWith(bikes: sortedBikes))
        : emit((state as Search).copyWith(foundBikes: sortedBikes));
  }

  void updateFilter(BikeFilter filter) {
    state is Loaded
        ? emit((state as Loaded).copyWith(
            filter: filter,
            filterMode: !filter.isEmpty,
          ))
        : emit((state as Search).copyWith(
            filter: filter,
            filterMode: !filter.isEmpty,
          ));
  }

  void updateBikes() {
    final filter = getFilter();
    if (!filter.isEmpty) {
      final filteredBikes = _filterByCategory(filter);
      final fileteredBySize = _filterBySize(filter);
      final fileteredByPrice = _filterByPrice(filter);

      filteredBikes.removeWhere((item) {
        return !fileteredBySize.contains(item);
      });
      filteredBikes.removeWhere((item) => !fileteredByPrice.contains(item));
      state is Loaded
          ? emit((state as Loaded).copyWith(
              filteredBikes: filteredBikes,
              filterMode: true,
            ))
          : emit((state as Search).copyWith(
              filteredBikes: filteredBikes,
              filterMode: true,
            ));
    } else {
      state is Loaded
          ? emit((state as Loaded).copyWith(
              filterMode: false,
            ))
          : emit((state as Search).copyWith(
              filterMode: false,
            ));
    }
  }

  List<Bike> _filterByCategory(BikeFilter filter) {
    final bikesToFilter = _getBikesFromState();

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
    final bikesToFilter = _getBikesFromState();
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
    final list = _getBikesFromState()
        .where((bike) =>
            filter.prices.start <= bike.price &&
            bike.price <= filter.prices.end)
        .toList();
    return list;
  }

  List<Bike> _getBikesFromState() =>
      state is Loaded ? (state as Loaded).bikes : (state as Search).foundBikes;

  BikeFilter getFilter() =>
      state is Search ? (state as Search).filter : (state as Loaded).filter;
}

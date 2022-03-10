import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import 'package:bike_catalog/base/base.dart';
import 'package:bike_catalog/constants/constants.dart';
import 'package:bike_catalog/models/bike.dart';
import 'package:bike_catalog/screens/bikes/bikes_screen_m.dart';
import 'package:bike_catalog/services/navigation/navigation.dart';
import 'package:bike_catalog/services/network/network.dart';

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

  void loadBikes() async {
    final bikes = <Bike>[];
    try {
      final response = await _network.get();
      Iterable bikesJson = jsonDecode(response.body);
      bikes.addAll(_convertBikesJson(bikesJson));
    } catch (error) {
      debugPrint('error: $error');
      bikes.addAll(await _loadBikesJsonData());
    }
    emit(Loaded(bikes));
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
}

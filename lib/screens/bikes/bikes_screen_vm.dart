import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import 'package:bike_catalog/base/base.dart';
import 'package:bike_catalog/constants/constants.dart';
import 'package:bike_catalog/models/bike.dart';
import 'package:bike_catalog/screens/bikes/bikes_screen_m.dart';
import 'package:bike_catalog/services/network/network.dart';

@injectable
class BikesScreenViewModel extends BaseViewModel<BikesScreenState> {
  BikesScreenViewModel({
    required INetworkService network,
  })  : _network = network,
        super(const Loading());
  final INetworkService _network;

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

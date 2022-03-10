import 'dart:convert';

import 'package:bike_catalog/models/bike.dart';
import 'package:injectable/injectable.dart';

import 'package:bike_catalog/base/base.dart';
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
    final response = await _network.get();
    Iterable bikesJson = jsonDecode(response.body);
    final bikes = <Bike>[];
    if (bikesJson.isNotEmpty) {
      for (var bike in bikesJson) {
        bikes.add(Bike.fromJson(bike));
      }
    } else {
      //TODO: laod from resources
    }
    emit(Loaded(bikes));
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:bikes/base/base.dart';
import 'package:bikes/models/models.dart';

part 'bikes_screen_m.freezed.dart';

@freezed
class BikesScreenState extends BaseState with _$BikesScreenState {
  const factory BikesScreenState.loading() = Loading;
  const factory BikesScreenState.loaded({
    required List<Bike> bikes,
    required List<Bike> filteredBikes,
    required BikeFilter filter,
    required bool filterMode,
  }) = Loaded;
}

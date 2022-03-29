import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:bikes/base/base.dart';
import 'package:bikes/models/models.dart';

part 'details_screen_m.freezed.dart';

@freezed
class DetailsScreenState extends BaseState with _$DetailsScreenState {
  const factory DetailsScreenState.initializing() = Initializing;
  const factory DetailsScreenState.loaded(Bike bike) = Loaded;
}

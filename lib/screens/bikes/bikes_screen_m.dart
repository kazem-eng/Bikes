import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bike_catalog/base/base.dart';

part 'bikes_screen_m.freezed.dart';

@freezed
class BikesScreenState extends BaseState with _$BikesScreenState {
  const factory BikesScreenState.loading() = Loading;
  const factory BikesScreenState.loaded(List<dynamic> bikes) = Loaded;
}

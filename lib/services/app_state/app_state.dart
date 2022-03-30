import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:bikes/models/models.dart';
import 'package:bikes/base/base.dart';

part 'app_state.freezed.dart';

@freezed
class AppState extends BaseState with _$AppState {
  const factory AppState.defaultState({
    required bool isAuthenticated,
    required bool isBusy,
    User? userInfo,
  }) = DefaultState;
}

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:bikes/base/base.dart';

part 'login_screen_m.freezed.dart';

@freezed
class LoginScreenState extends BaseState with _$LoginScreenState {
  const factory LoginScreenState.init() = Init;
  const factory LoginScreenState.busy() = Busy;
  const factory LoginScreenState.failedLogin(String message) = FailedLogin;
  const factory LoginScreenState.successLogin(String message) = SuccessLogin;
}

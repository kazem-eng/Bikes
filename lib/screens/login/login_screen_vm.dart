import 'package:injectable/injectable.dart';

import 'package:bikes/base/base.dart';
import 'package:bikes/constants/constants.dart';
import 'package:bikes/screens/login/login_screen_m.dart';
import 'package:bikes/services/services.dart';

@injectable
class LoginScreenViewModel extends BaseViewModel<LoginScreenState> {
  LoginScreenViewModel({
    required INavigationService navigationService,
    required IAuthService authService,
  })  : _navigationService = navigationService,
        _authService = authService,
        super(const Init());

  final INavigationService _navigationService;
  final IAuthService _authService;

  Future<void> signIn() async {
    emit(const Busy());

    var errorMessage = '';
    var user = await _authService.signInWithGoogleAccount().onError(
      (error, stackTrace) {
        errorMessage = error.toString();
        return null;
      },
    );
    if (errorMessage.isNotEmpty || user == null) {
      emit(FailedLogin('${Strings.failLogin}  $errorMessage'));
    } else {
      emit(const SuccessLogin(Strings.successfulLogin));
      _navigationService.replace(route: BikesRoute());
    }
  }
}

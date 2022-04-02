import 'package:bikes/base/base.dart';
import 'package:bikes/services/app_state/app_state.dart';
import 'package:bikes/services/services.dart';

class AppViewModel extends BaseViewModel<AppState> {
  AppViewModel({
    required IAuthService authenticationService,
  })  : _authenticationService = authenticationService,
        super(
          const AppState.defaultState(
            isAuthenticated: false,
            isBusy: false,
          ),
        ) {
    _authenticationService.controller.stream
        .listen(_handleAuthenticationController);
    if (authenticationService.isLoggedIn) {
      emit(
        const AppState.defaultState(
          isBusy: true,
          isAuthenticated: true,
        ),
      );
      loadUserName();
    }
  }

  final IAuthService _authenticationService;

  void _handleAuthenticationController(event) {
    var _event = event as AuthenticationStatus;
    emit(
      AppState.defaultState(
        isAuthenticated: _event == AuthenticationStatus.authenticated,
        isBusy: _event == AuthenticationStatus.busy,
        userInfo: _authenticationService.userInfo,
      ),
    );
  }

  Future<void> loadUserName() async {
    var userInfo = await _authenticationService.currentUser;
    emit(
      AppState.defaultState(
        isBusy: false,
        isAuthenticated: true,
        userInfo: userInfo,
      ),
    );
  }
}

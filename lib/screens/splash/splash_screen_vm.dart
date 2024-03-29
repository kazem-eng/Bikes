import 'package:injectable/injectable.dart';

import 'package:bikes/base/base.dart';
import 'package:bikes/services/services.dart';
import 'package:bikes/screens/splash/splash_screen_m.dart';

@injectable
class SplashScreenViewModel extends BaseViewModel<SplashScreenState> {
  SplashScreenViewModel({
    required INavigationService navigationService,
  })  : _navigationService = navigationService,
        super(const Loading());

  final INavigationService _navigationService;

  static const _navigationDelay = 2;

  void navigateToLogin() {
    Future.delayed(
      const Duration(seconds: _navigationDelay),
      () => _navigationService.replace(route: LoginRoute()),
    );
  }
}

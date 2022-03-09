import 'package:injectable/injectable.dart';

import 'package:bike_catalog/base/base.dart';
import 'package:bike_catalog/screens/splash/splash_screen_m.dart';
import 'package:bike_catalog/services/navigation/navigation.dart';

@injectable
class SplashScreenViewModel extends BaseViewModel<SplashScreenState> {
  SplashScreenViewModel({
    required INavigationService navigationService,
  })  : _navigationService = navigationService,
        super(const Initialized());

  final INavigationService _navigationService;

  void navigateToLogin() {
    Future.delayed(const Duration(seconds: 2), () {
      _navigationService.replace(route: BikesRoute());
    });
  }
}

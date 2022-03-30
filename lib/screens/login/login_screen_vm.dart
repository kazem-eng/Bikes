import 'package:injectable/injectable.dart';

import 'package:bikes/base/base.dart';
import 'package:bikes/services/services.dart';
import 'package:bikes/screens/login/login_screen_m.dart';

@injectable
class LoginScreenViewModel extends BaseViewModel<LoginScreenState> {
  LoginScreenViewModel({
    required INavigationService navigationService,
  })  : _navigationService = navigationService,
        super(const Loading());

  final INavigationService _navigationService;

  Future<void> signIn() async {
    _navigationService.replace(route: BikesRoute());
  }
}

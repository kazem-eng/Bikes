import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bike_catalog/base/base.dart';
import 'package:bike_catalog/constants/constants.dart';
import 'package:bike_catalog/screens/splash/splash_screen_m.dart';
import 'package:bike_catalog/screens/splash/splash_screen_vm.dart';

class SplashScreen extends BaseView<SplashScreenViewModel> {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final _logoWidth = _screenSize.width * .3;

    return BlocBuilder<SplashScreenViewModel, SplashScreenState>(
      bloc: viewModel..navigateToLogin(),
      builder: (_, state) {
        return SafeArea(
          child: Scaffold(
            body: Center(
              child: Image.asset(
                Resources.internetStoreLogo,
                width: _logoWidth,
              ),
            ),
          ),
        );
      },
    );
  }
}

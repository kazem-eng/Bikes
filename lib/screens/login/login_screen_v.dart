import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bikes/screens/login/login_screen_m.dart';
import 'package:bikes/screens/login/login_screen_vm.dart';
import 'package:bikes/base/base.dart';
import 'package:bikes/constants/constants.dart';
import 'package:bikes/theme/theme.dart';
import 'package:bikes/ui_kit/helpers/toaster_helper.dart';
import 'package:bikes/ui_kit/ui_kit.dart';

class LoginScreen extends BaseView<LoginScreenViewModel> {
  LoginScreen({Key? key}) : super(key: key);

  static const _googleIconSize = 28.0;
  static const _buttonSpacer = 48.0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginScreenViewModel, LoginScreenState>(
      bloc: viewModel,
      builder: (_, state) {
        return SafeArea(
          child: Scaffold(
            body: Center(
              child: _buildScreen(
                state: state,
                context: context,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildScreen({
    required LoginScreenState state,
    required BuildContext context,
  }) {
    if (state is Init) {
      return _loggedOutView(context);
    } else if (state is Busy) {
      return const Loading();
    } else if (state is FailedLogin) {
      Toaster.errorToast(context: context, message: state.message);
      debugPrint(state.message);
      return _loggedOutView(context);
    } else {
      Toaster.successToast(
          context: context, message: (state as SuccessLogin).message);
      return Container();
    }
  }

  Widget _loggedOutView(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Resources.login),
        const SizedBox(height: _buttonSpacer),
        Container(
          decoration: AppTheme.of(context).theme.cardDecoration,
          width: MediaQuery.of(context).size.width * .6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Resources.googleLogo,
                width: _googleIconSize,
                height: _googleIconSize,
              ),
              Button.plain(
                title: Strings.loginWithGoogle,
                onTap: () {
                  viewModel.signIn();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

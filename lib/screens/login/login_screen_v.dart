import 'package:bikes/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bikes/base/base.dart';
import 'package:bikes/screens/login/login_screen_m.dart';
import 'package:bikes/screens/login/login_screen_vm.dart';

class LoginScreen extends BaseView<LoginScreenViewModel> {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginScreenViewModel, LoginScreenState>(
      bloc: viewModel,
      builder: (_, state) {
        return SafeArea(
          child: Scaffold(
            body: Center(
              child: Button.button(
                  title: 'Login',
                  onTap: () {
                    viewModel.signIn();
                  }),
            ),
          ),
        );
      },
    );
  }
}

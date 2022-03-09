import 'package:flutter/cupertino.dart';

import 'package:bike_catalog/base/base_viewmodel.dart';
import 'package:bike_catalog/setup.dart';

abstract class BaseView<T extends BaseViewModel> extends StatelessWidget {
  BaseView({Key? key}) : super(key: key) {
    _viewModel = locateService<T>();
  }

  late final T _viewModel;

  T get viewModel => _viewModel;
}

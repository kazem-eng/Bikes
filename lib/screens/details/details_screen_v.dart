import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bike_catalog/base/base.dart';
import 'package:bike_catalog/models/bike.dart';
import 'package:bike_catalog/screens/details/details_screen_m.dart';
import 'package:bike_catalog/screens/details/details_screen_vm.dart';
import 'package:bike_catalog/theme/theme.dart';
import 'package:bike_catalog/ui_kit/ui_kit.dart';

class DetailsScreen extends BaseView<DetailsScreenViewModel> {
  DetailsScreen({
    required Bike bikeDetails,
    Key? key,
  })  : _bikeDetails = bikeDetails,
        super(key: key);

  final Bike _bikeDetails;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return BlocBuilder<DetailsScreenViewModel, DetailsScreenState>(
      bloc: viewModel..loadBikeDetails(bikeDetails: _bikeDetails),
      builder: (_, state) {
        return SafeArea(
          child: Scaffold(
            body: (state is Initializing)
                ? const Loading()
                : _buildBikeDetails(
                    appTheme: appTheme,
                    state: state,
                  ),
          ),
        );
      },
    );
  }

  Widget _buildBikeDetails({
    required IAppThemeData appTheme,
    required DetailsScreenState state,
  }) =>
      Center(
        child: Label('Bike Details : ${_bikeDetails.name}'),
      );
}

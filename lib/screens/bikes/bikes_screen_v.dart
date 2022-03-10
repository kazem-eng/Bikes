import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bike_catalog/screens/bikes/bikes_screen_m.dart';
import 'package:bike_catalog/screens/bikes/bikes_screen_vm.dart';
import 'package:bike_catalog/theme/theme.dart';
import 'package:bike_catalog/ui_kit/ui_kit.dart' as ui_kit;
import 'package:bike_catalog/base/base.dart';

class BikesScreen extends BaseView<BikesScreenViewModel> {
  BikesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return BlocBuilder<BikesScreenViewModel, BikesScreenState>(
      bloc: viewModel..loadBikes(),
      builder: (_, state) {
        return SafeArea(
          child: Scaffold(
            body: (state is Loading)
                ? const ui_kit.Loading()
                : ((state as Loaded).bikes.isEmpty)
                    ? const ui_kit.EmptyIndicator()
                    : _buildProjectList(
                        appTheme: appTheme,
                        state: state,
                      ),
          ),
        );
      },
    );
  }

  Widget _buildProjectList({
    required IAppThemeData appTheme,
    required BikesScreenState state,
  }) {
    return ListView.builder(
      itemCount: (state as Loaded).bikes.length,
      itemBuilder: (context, index) {
        final bike = state.bikes[index];
        return ui_kit.CardItem(
          title: bike.name,
          subtitle: bike.description,
          onTap: () {
            viewModel.onBikeSelection(selectedBike: bike);
          },
        );
      },
    );
  }
}

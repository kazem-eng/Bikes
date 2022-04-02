import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bikes/base/base.dart';
import 'package:bikes/constants/constants.dart';
import 'package:bikes/models/models.dart';
import 'package:bikes/screens/bikes/bikes_screen_m.dart';
import 'package:bikes/screens/bikes/bikes_screen_vm.dart';
import 'package:bikes/screens/bikes/widgets/filter_widget.dart';
import 'package:bikes/theme/theme.dart';
import 'package:bikes/ui_kit/helpers/dialog_helper.dart';
import 'package:bikes/ui_kit/ui_kit.dart' as ui_kit;

class BikesScreen extends BaseView<BikesScreenViewModel> {
  BikesScreen({
    Key? key,
  }) : super(key: key);

  static const _listFlex = 10;
  static const _toolbarMargin = 2.0;
  static const _dialogMaxHeight = 600.0;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return BlocBuilder<BikesScreenViewModel, BikesScreenState>(
      bloc: viewModel..loadBikes(context),
      builder: (_, state) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: (state is Loading)
                ? const ui_kit.Loading()
                : _buildScreenBody(
                    appTheme: appTheme,
                    state: state,
                    context: context,
                  ),
          ),
        );
      },
    );
  }

  Widget _buildScreenBody({
    required IAppThemeData appTheme,
    required BikesScreenState state,
    required BuildContext context,
  }) {
    return Column(
      children: [
        _buildToolBar(
          state: state,
          context: context,
        ),
        _buildBikeList(
          state: state,
          context: context,
        ),
      ],
    );
  }

  Widget _buildToolBar({
    required BikesScreenState state,
    required BuildContext context,
  }) =>
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(_toolbarMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 18,
                  top: 18,
                  bottom: 18,
                ),
                child: Image.asset(Resources.bikesLogo),
              ),
              const Spacer(),
              ui_kit.Button.plain(
                onTap: () {
                  _showFilterDialog(
                    context: context,
                    state: state,
                  );
                },
                title: Strings.filter,
                icon: Icons.filter_alt_outlined,
              ),
              _buildSortContextMenu(),
            ],
          ),
        ),
      );

  Widget _buildSortContextMenu() => ui_kit.ContextMenu(
        title: Strings.sort,
        icon: const Icon(Icons.sort),
        actions: [
          ui_kit.ContextMenuAction(
              title: Strings.highestPrice,
              onTap: () {
                viewModel.sort(sortType: BikeSortType.priceASC);
              }),
          ui_kit.ContextMenuAction(
              title: Strings.lowestPrice,
              onTap: () {
                viewModel.sort(sortType: BikeSortType.priceDES);
              }),
          ui_kit.ContextMenuAction(
              title: Strings.alphabetically,
              onTap: () {
                viewModel.sort(sortType: BikeSortType.alphabetically);
              }),
        ],
      );

  Widget _buildBikeList({
    required BikesScreenState state,
    required BuildContext context,
  }) =>
      Expanded(
          flex: _listFlex,
          child: _buildListView(
            bikes: (state as Loaded).filterMode
                ? state.filteredBikes
                : state.bikes,
            context: context,
          ));

  Widget _buildListView({
    required List<Bike> bikes,
    required BuildContext context,
  }) =>
      bikes.isEmpty
          ? const ui_kit.EmptyIndicator()
          : ListView.builder(
              key: UniqueKey(),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: bikes.length,
              itemBuilder: (context, index) => _cardItem(bikes[index]),
            );

  Widget _cardItem(Bike bike) => ui_kit.CardItem(
        title: bike.brand,
        subtitle: bike.name,
        titleSuffix: bike.year.toString(),
        imageURL: bike.thubmnail,
        subtitlePrefix: bike.size,
        subtitlePostfix: bike.category,
        addOnIcon: _buildAddOnIcon(bike),
        onTap: () {
          viewModel.onBikeSelection(selectedBike: bike);
        },
      );

  Widget _buildAddOnIcon(Bike bike) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(8)),
              color: Colors.red,
            ),
            padding: const EdgeInsets.all(4.0),
            child: ui_kit.Label(
              '${Strings.currenctyIndicator}${bike.price.toStringAsFixed(2)}',
              typography: TypographyFamily.button,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      );

  Future<void> _showFilterDialog({
    required BuildContext context,
    required BikesScreenState state,
  }) async {
    DialogHelper.show(
      barrierLabel: Strings.filter,
      context: context,
      title: Strings.filter,
      body: FilterWidget(
        filter: (state as Loaded).filter,
        onChange: (newFilter) {
          viewModel.updateFilter(newFilter);
        },
      ),
      maxHeight: _dialogMaxHeight,
    ).then(
      (value) => viewModel.filterBikes(),
    );
  }
}

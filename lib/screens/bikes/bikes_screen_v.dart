import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bike_catalog/base/base.dart';
import 'package:bike_catalog/constants/constants.dart';
import 'package:bike_catalog/models/bike.dart';
import 'package:bike_catalog/screens/bikes/bikes_screen_m.dart';
import 'package:bike_catalog/screens/bikes/bikes_screen_vm.dart';
import 'package:bike_catalog/screens/splash/splash_screen_m.dart';
import 'package:bike_catalog/theme/theme.dart';
import 'package:bike_catalog/ui_kit/ui_kit.dart' as ui_kit;

class BikesScreen extends BaseView<BikesScreenViewModel> {
  BikesScreen({
    Key? key,
  }) : super(key: key);

  static const _listFlex = 10;
  static const _toolbarMargin = 2.0;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return BlocBuilder<BikesScreenViewModel, BikesScreenState>(
      bloc: viewModel..loadBikes(),
      builder: (_, state) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: (state is Loading)
                ? const ui_kit.Loading()
                : _buildScreenBody(
                    appTheme: appTheme,
                    state: state,
                  ),
          ),
        );
      },
    );
  }

  Widget _buildScreenBody({
    required IAppThemeData appTheme,
    required BikesScreenState state,
  }) {
    return Column(
      children: [
        _buildToolBar(state),
        _buildBikeList(state: state),
      ],
    );
  }

  Widget _buildToolBar(BikesScreenState state) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(_toolbarMargin),
        child: Row(
          children: [
            _buildSearchBox(state),
            const ui_kit.Label(Strings.filter),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.filter_alt_outlined),
            ),
            const ui_kit.Label(Strings.sort),
            _buildSortItems(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBox(BikesScreenState state) {
    final _controller = ui_kit.TextController(text: _getSearchValue(state));
    return Expanded(
      child: ui_kit.TextInput(
        controller: _controller,
        suffixIcon: Icons.search,
        hint: Strings.search,
        onChanged: (searchValue) {
          viewModel.search(searchValue);
        },
      ),
    );
  }

  Widget _buildSortItems() => ui_kit.ContextMenu(
        actions: [
          ui_kit.ContextMenuAction(
              title: Strings.highestPrice,
              onTap: () {
                viewModel.sort(sortType: SortType.priceASC);
              }),
          ui_kit.ContextMenuAction(
              title: Strings.lowestPrice,
              onTap: () {
                viewModel.sort(sortType: SortType.priceDES);
              }),
          ui_kit.ContextMenuAction(
              title: Strings.alphabetically,
              onTap: () {
                viewModel.sort(sortType: SortType.alphabetically);
              }),
          ui_kit.ContextMenuAction(
              title: Strings.year,
              onTap: () {
                viewModel.sort(sortType: SortType.year);
              }),
        ],
        icon: const Icon(Icons.sort),
      );

  Widget _buildBikeList({
    required BikesScreenState state,
  }) {
    return Expanded(
        flex: _listFlex,
        child: state is Loaded
            ? _buildListView(bikes: state.bikes)
            : _buildListView(bikes: (state as Search).foundBikes));
  }

  Widget _buildListView({required List<Bike> bikes}) => bikes.isEmpty
      ? const ui_kit.EmptyIndicator()
      : ListView.builder(
          itemCount: bikes.length,
          itemBuilder: (context, index) {
            final foundBike = bikes[index];
            return _cardItem(foundBike);
          },
        );

  Widget _cardItem(Bike bike) => ui_kit.CardItem(
        title: bike.brand,
        subtitle: bike.name,
        imageURL: bike.thubmnail,
        addOnIcon: _buildAddOnIcon(bike),
        onTap: () {
          viewModel.onBikeSelection(selectedBike: bike);
        },
      );
  Widget _buildAddOnIcon(Bike bike) => Container(
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
      );

  String _getSearchValue(BikesScreenState state) =>
      state is Loaded || state is Initialized
          ? ''
          : (state as Search).searchKey;
}

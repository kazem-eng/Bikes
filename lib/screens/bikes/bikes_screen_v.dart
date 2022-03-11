import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bike_catalog/base/base.dart';
import 'package:bike_catalog/constants/constants.dart';
import 'package:bike_catalog/models/bike.dart';
import 'package:bike_catalog/screens/bikes/bikes_screen_m.dart';
import 'package:bike_catalog/screens/bikes/bikes_screen_vm.dart';
import 'package:bike_catalog/screens/splash/splash_screen_m.dart';
import 'package:bike_catalog/theme/theme.dart';
import 'package:bike_catalog/ui_kit/helpers/dialog_helper.dart';
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
      bloc: viewModel..loadBikes(context),
      builder: (_, state) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: (state is Loading)
                ? const ui_kit.Loading()
                : _buildScreenBody(
                    appTheme: appTheme, state: state, context: context),
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
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(_toolbarMargin),
        child: Row(
          children: [
            _buildSearchBox(state),
            const ui_kit.Label(Strings.filter),
            IconButton(
              onPressed: () {
                _showFilterDialog(context: context);
              },
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
    required BuildContext context,
  }) {
    return Expanded(
        flex: _listFlex,
        child: state is Loaded
            ? _buildListView(
                bikes: state.bikes,
                context: context,
              )
            : _buildListView(
                bikes: (state as Search).foundBikes,
                context: context,
              ));
  }

  Widget _buildListView({
    required List<Bike> bikes,
    required BuildContext context,
  }) =>
      bikes.isEmpty
          ? const ui_kit.EmptyIndicator()
          : RefreshIndicator(
              onRefresh: () => viewModel.loadBikes(context),
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: bikes.length,
                itemBuilder: (context, index) {
                  final foundBike = bikes[index];
                  return _cardItem(foundBike);
                },
              ),
            );

  Widget _cardItem(Bike bike) => ui_kit.CardItem(
        title: bike.brand,
        subtitle: bike.name,
        titleSuffix: bike.year.toString(),
        imageURL: bike.thubmnail,
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

  String _getSearchValue(BikesScreenState state) =>
      state is Loaded || state is Initialized
          ? ''
          : (state as Search).searchKey;

  Future<void> _showFilterDialog({required BuildContext context}) async {
    final categoryChips = <Widget>[];
    for (var category in BikeCategory.values) {
      categoryChips.add(
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: ui_kit.ReactiveChip(
            label: category.name,
          ),
        ),
      );
    }
    final sizeChips = <Widget>[];
    for (var size in BikeSize.values) {
      sizeChips.add(
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: ui_kit.ReactiveChip(
            label: size.name,
          ),
        ),
      );
    }
    DialogHelper.show(
      barrierLabel: Strings.filter,
      context: context,
      title: Strings.filter,
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ui_kit.Label(
              'Select Category',
              typography: TypographyFamily.headline7,
            ),
            Wrap(
              children: [...categoryChips],
            ),
            SizedBox(
              height: 20,
            ),
            const ui_kit.Label(
              'Select Price',
              typography: TypographyFamily.headline7,
            ),
            const ui_kit.CustomRangeSlider(),
            SizedBox(
              height: 20,
            ),
            const ui_kit.Label(
              'Select Size',
              typography: TypographyFamily.headline7,
            ),
            Wrap(
              children: [...sizeChips],
            ),
          ],
        ),
      ),
      maxHeight: 600,
    );
  }
}

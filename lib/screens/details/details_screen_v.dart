import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bike_catalog/base/base.dart';
import 'package:bike_catalog/constants/constants.dart';
import 'package:bike_catalog/models/bike.dart';
import 'package:bike_catalog/screens/details/details_screen_m.dart';
import 'package:bike_catalog/screens/details/details_screen_vm.dart';
import 'package:bike_catalog/theme/theme.dart';
import 'package:bike_catalog/ui_kit/ui_kit.dart';
import 'package:bike_catalog/ui_kit/widgets/image_slider.dart';

class DetailsScreen extends BaseView<DetailsScreenViewModel> {
  DetailsScreen({
    required Bike bikeDetails,
    Key? key,
  })  : _bikeDetails = bikeDetails,
        super(key: key);

  final Bike _bikeDetails;

  static const _verticalSpacer = SizedBox(height: 16);

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return BlocBuilder<DetailsScreenViewModel, DetailsScreenState>(
      bloc: viewModel..loadBikeDetails(bikeDetails: _bikeDetails),
      builder: (_, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: appTheme.colors.defaultText),
              backgroundColor: appTheme.colors.transparent,
              elevation: 0,
            ),
            body: (state is Initializing)
                ? const Loading()
                : _buildBikeDetails(
                    appTheme: appTheme,
                    state: state,
                    context: context,
                  ),
          ),
        );
      },
    );
  }

  Widget _buildBikeDetails({
    required IAppThemeData appTheme,
    required DetailsScreenState state,
    required BuildContext context,
  }) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Label(
            _bikeDetails.brand,
            typography: TypographyFamily.caption,
          ),
          Label(
            _bikeDetails.name,
            typography: TypographyFamily.headline5,
          ),
          _verticalSpacer,
          SizedBox(
            height: screenSize.height * 0.3,
            child: CarouselWithIndicatorDemo(imageList: _bikeDetails.images),
          ),
          _verticalSpacer,
          Row(
            children: [
              Label(
                '${Strings.currenctyIndicator}${_bikeDetails.price.toStringAsFixed(2)}',
                style: appTheme.typographies.robotoFontFamily.headline6
                    .copyWith(color: Colors.red),
              ),
            ],
          ),
          _verticalSpacer,
          const Label(
            Strings.description,
            typography: TypographyFamily.headline7,
          ),
          Label(
            _bikeDetails.description,
            maxline: 7,
            typography: TypographyFamily.body2,
            textAlign: TextAlign.justify,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 4,
            ),
            child: Button.button(
              title: Strings.addToBasket,
              onTap: () {},
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bike_catalog/screens/details/details_screen_m.dart';
import 'package:bike_catalog/screens/details/details_screen_vm.dart';
import 'package:bike_catalog/base/base.dart';
import 'package:bike_catalog/constants/constants.dart';
import 'package:bike_catalog/models/models.dart';
import 'package:bike_catalog/theme/theme.dart';
import 'package:bike_catalog/ui_kit/ui_kit.dart';

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
      bloc: viewModel..loadBikeDetails(_bikeDetails),
      builder: (_, state) {
        return SafeArea(
          child: Scaffold(
            appBar: _buildAppbar(appTheme),
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

  AppBar _buildAppbar(IAppThemeData appTheme) => AppBar(
        iconTheme: IconThemeData(color: appTheme.colors.defaultText),
        backgroundColor: appTheme.colors.transparent,
        elevation: 0,
      );

  Widget _buildBikeDetails({
    required IAppThemeData appTheme,
    required DetailsScreenState state,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ..._buildDetailsHeader(appTheme),
          ..._buildSlider(context),
          ..._buildPrice(appTheme),
          ..._buildDescription(),
        ],
      ),
    );
  }

  List<Widget> _buildDetailsHeader(IAppThemeData appTheme) => [
        Label(
          _bikeDetails.brand,
          typography: TypographyFamily.caption,
        ),
        Label(
          _bikeDetails.name,
          typography: TypographyFamily.headline5,
        ),
        Label(
          '${_bikeDetails.year.toString()}  -  ${_bikeDetails.category}',
          typography: TypographyFamily.body2,
        ),
        _verticalSpacer,
      ];

  List<Widget> _buildSlider(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return [
      SizedBox(
        height: screenSize.height * 0.3,
        child: CarouselWithIndicatorDemo(imageList: _bikeDetails.images),
      ),
      _verticalSpacer,
    ];
  }

  List<Widget> _buildPrice(IAppThemeData appTheme) {
    return [
      Row(
        children: [
          Label(
            '${Strings.currenctyIndicator}${_bikeDetails.price.toStringAsFixed(2)}',
            style: appTheme.typographies.robotoFontFamily.headline6
                .copyWith(color: appTheme.colors.errorCaption),
          ),
          const Spacer(),
          HeroAvatar.mediumText(text: _bikeDetails.size)
        ],
      ),
    ];
  }

  List<Widget> _buildDescription() => [
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
        Button.button(
          title: Strings.addToBasket,
          onTap: () {},
          width: double.infinity,
        )
      ];
}

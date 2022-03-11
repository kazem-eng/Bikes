import 'package:bike_catalog/theme/theme.dart';
import 'package:flutter/material.dart';

part 'colors.dart';
part 'typographies.dart';
part 'theme_helper.dart';

class DefaultTheme extends IAppThemeData {
  static const _defaultBorderRadius = 10.0;
  static const _fabBorderRadius = 26.0;
  static const _smallFabBorderRadius = 18.0;
  static const _filledButtonElevation = 2.0;
  static const _zeroElevetion = 0.0;
  static const _fabButtonElevation = 1.0;
  static const _fabHoverBorderWidth = 1.5;
  static const _transparentColor = Colors.transparent;
  static const _zeroPadding = EdgeInsets.zero;
  static const _buttonSplashEffect = NoSplash.splashFactory;
  static const _buttonPadding = EdgeInsets.symmetric(
    vertical: 12.0,
    horizontal: 16.0,
  );

  @override
  ITypographies get typographies => const _Typographies();

  @override
  IColors get colors => const _Colors();

  @override
  ThemeData get mainTheme => ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

  @override
  BorderRadius get defaultBorderRadius =>
      BorderRadius.circular(_defaultBorderRadius);

  @override
  InputBorder get inputBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(_defaultBorderRadius),
        borderSide: const BorderSide(
          width: 0.5,
          color: Colors.red,
          style: BorderStyle.none,
        ),
      );

  // card
  @override
  BoxDecoration get cardDecoration => BoxDecoration(
        color: colors.secondaryBackground,
        borderRadius: BorderRadius.circular(_defaultBorderRadius),
        border: Border.all(color: colors.primaryBorder),
      );

  @override
  TextStyle get cardDescriptionTextStyle =>
      _Typographies._robotoTypography.body1
          .copyWith(color: colors.foregroundColor);

  @override
  TextStyle get cardSubtitleTextStyle => _Typographies._robotoTypography.body1
      .copyWith(color: colors.disabledPrimaryBackground);

  @override
  TextStyle get cardTitleTextStyle => _Typographies._robotoTypography.headline1;

  @override
  ButtonStyle get filledButtonStyle => ButtonStyle(
        foregroundColor: _materialStateColorBuilder(
          hoverColor: colors.secondaryText,
          color: colors.primaryText,
        ),
        backgroundColor: _materialStateColorBuilder(
          hoverColor: colors.lightPrimaryBackground,
          color: colors.primaryBackground,
        ),
        textStyle: _textStyleBuilder(typographies.robotoFontFamily.button),
        padding: _buttonPaddingBuilder(_buttonPadding),
        splashFactory: _buttonSplashEffect,
        shape: _filledButtonShapeBuilder(_defaultBorderRadius),
        mouseCursor: _disabledButtonsMouseCursorBuilder(),
        elevation: _buttonElevationBuilder(_filledButtonElevation),
      );

  @override
  ButtonStyle get fabFilledButtonStyle => filledButtonStyle.copyWith(
        foregroundColor: _materialStateColorBuilder(
          hoverColor: colors.secondaryBackground,
          color: colors.divider,
        ),
        backgroundColor: _materialStateColorBuilder(
          hoverColor: colors.disabledPrimaryBackground,
          color: colors.foregroundColor,
        ),
        padding: _buttonPaddingBuilder(_zeroPadding),
        shape: _fabButtonShapeBuilder(_fabBorderRadius),
      );

  @override
  ButtonStyle get plainButtonStyle => filledButtonStyle.copyWith(
        foregroundColor: _materialStateColorBuilder(
          hoverColor: colors.defaultText,
          color: colors.foregroundColor,
        ),
        backgroundColor: _materialStateColorBuilder(
          hoverColor: colors.divider,
          color: _transparentColor,
        ),
        elevation: _buttonElevationBuilder(_zeroElevetion),
      );

  @override
  ButtonStyle get outlinedButtonStyle => filledButtonStyle.copyWith(
        foregroundColor: _materialStateColorBuilder(
          hoverColor: colors.defaultText,
          color: colors.foregroundColor,
        ),
        backgroundColor: MaterialStateProperty.all(colors.secondaryText),
        elevation: _buttonElevationBuilderWithHover(
          hoverElevation: _filledButtonElevation,
          elevation: _zeroElevetion,
        ),
        shape: _outlinedButtonShapeBuilder(
          borderRadius: _defaultBorderRadius,
          borderColor: colors.disabledText,
          hoverBorderColor: colors.defaultBorder,
        ),
      );

  @override
  ButtonStyle get disabledFilledButtonStyle => filledButtonStyle.copyWith(
        foregroundColor: MaterialStateProperty.all(colors.disabledText),
        backgroundColor:
            MaterialStateProperty.all(colors.disabledPrimaryBackground),
      );

  @override
  ButtonStyle get disabledOutlinedButtonStyle => outlinedButtonStyle.copyWith(
        foregroundColor: MaterialStateProperty.all(colors.disabledText),
        backgroundColor: MaterialStateProperty.all(_transparentColor),
        shape: _filledButtonShapeBuilder(_defaultBorderRadius),
        elevation: _buttonElevationBuilder(_zeroElevetion),
      );

  @override
  ButtonStyle get disabledPlainButtonStyle => plainButtonStyle.copyWith(
        foregroundColor: MaterialStateProperty.all(colors.disabledText),
        backgroundColor: MaterialStateProperty.all(_transparentColor),
      );

  @override
  ButtonStyle get disabledFabFilledButtonStyle => fabFilledButtonStyle.copyWith(
        foregroundColor: MaterialStateProperty.all(colors.disabledText),
        backgroundColor:
            MaterialStateProperty.all(colors.disabledPrimaryBackground),
      );

  @override
  ButtonStyle get fabOutlinedButtonStyle => fabFilledButtonStyle.copyWith(
        foregroundColor: _materialStateColorBuilder(
          hoverColor: colors.defaultText,
          color: colors.foregroundColor,
        ),
        backgroundColor: MaterialStateProperty.all(_transparentColor),
        elevation: _buttonElevationBuilder(_zeroElevetion),
        shape: _fabOutlinedButtonShapeBuilder(
          hoverBorderWidth: _fabHoverBorderWidth,
          borderColor: colors.defaultBorder,
          hoverBorderColor: colors.disabledText,
          borderRadius: _fabBorderRadius,
        ),
      );

  @override
  ButtonStyle get disabledFabOutlinedButtonStyle =>
      fabOutlinedButtonStyle.copyWith(
        backgroundColor: MaterialStateProperty.all(colors.secondaryText),
        elevation: _buttonElevationBuilderWithHover(
          hoverElevation: _filledButtonElevation,
          elevation: _zeroElevetion,
        ),
      );

  @override
  ButtonStyle get fabPlainButtonStyle => fabFilledButtonStyle.copyWith(
        foregroundColor: _materialStateColorBuilder(
          hoverColor: colors.defaultText,
          color: colors.foregroundColor,
        ),
        backgroundColor: _materialStateColorBuilder(
          hoverColor: colors.secondaryBackground,
          color: colors.defaultBackground,
        ),
        elevation: _buttonElevationBuilderWithHover(
          hoverElevation: _fabButtonElevation,
          elevation: _zeroElevetion,
        ),
      );

  @override
  ButtonStyle get disabledFabPlainButtonStyle => fabPlainButtonStyle.copyWith(
        foregroundColor: MaterialStateProperty.all(colors.disabledText),
        backgroundColor: MaterialStateProperty.all(_transparentColor),
        elevation: _buttonElevationBuilder(_zeroElevetion),
      );

  @override
  ButtonStyle get smallFabFilledButtonStyle => fabFilledButtonStyle.copyWith(
      shape: _fabButtonShapeBuilder(_smallFabBorderRadius));

  @override
  ButtonStyle get smallFabOutlinedButtonStyle => fabOutlinedButtonStyle
      .copyWith(shape: _fabButtonShapeBuilder(_smallFabBorderRadius));

  @override
  ButtonStyle get smallFabPlainButtonStyle => fabPlainButtonStyle.copyWith(
        shape: _fabButtonShapeBuilder(_smallFabBorderRadius),
      );

  @override
  ButtonStyle get disabledSmallFabFilledButtonStyle =>
      disabledFabFilledButtonStyle.copyWith(
        shape: _fabButtonShapeBuilder(_smallFabBorderRadius),
      );

  @override
  ButtonStyle get disabledSmallFabOutlinedButtonStyle =>
      disabledFabFilledButtonStyle.copyWith(
        shape: _fabOutlinedButtonShapeBuilder(
          hoverBorderWidth: _fabHoverBorderWidth,
          borderColor: colors.defaultBorder,
          hoverBorderColor: colors.disabledText,
          borderRadius: _smallFabBorderRadius,
        ),
      );

  @override
  ButtonStyle get disabledSmallFabPlainButtonStyle =>
      disabledFabPlainButtonStyle.copyWith(
        shape: _fabButtonShapeBuilder(_smallFabBorderRadius),
      );

  @override
  ShapeBorder get dialogShapeBorder => const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(_defaultBorderRadius),
        ),
      );

  @override
  Decoration get dialogHeaderPrimaryDecoration => BoxDecoration(
        color: colors.headerPrimaryBackground,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(_defaultBorderRadius),
          topLeft: Radius.circular(_defaultBorderRadius),
        ),
      );

  @override
  Decoration get dialogHeaderErrorDecoration => BoxDecoration(
        color: colors.headerWarningBackground,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(_defaultBorderRadius),
          topLeft: Radius.circular(_defaultBorderRadius),
        ),
      );
}

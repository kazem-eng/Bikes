part of 'default_theme.dart';

abstract class _IColors {
  static const transparent = Color.fromRGBO(255, 255, 255, 0);

  static const black = Color.fromRGBO(0, 0, 0, 1);
  static const white = Color.fromRGBO(255, 255, 255, 1);

  static const grey0 = Color.fromRGBO(244, 244, 244, 1);
  static const grey01 = Color.fromRGBO(224, 224, 224, 1);
  static const grey02 = Color.fromRGBO(192, 192, 192, 1);
  static const grey03 = Color.fromRGBO(161, 161, 161, 1);
  static const grey04 = Color.fromRGBO(129, 129, 129, 1);
  static const grey05 = Color.fromRGBO(99, 99, 99, 1);
  static const grey06 = Color.fromRGBO(65, 65, 65, 1);

  static const blue01 = Color.fromRGBO(197, 220, 250, 1);
  static const blue04 = Color.fromRGBO(22, 114, 236, 1);
  static const blue05 = Color(0xff139ae1);
  static const blue08 = Color.fromRGBO(10, 57, 119, 1);

  static const green0 = Color.fromRGBO(225, 248, 226, 1);
  static const green04 = Color.fromRGBO(42, 185, 48, 1);
  static const green05 = Color.fromRGBO(31, 139, 36, 1);
  static const green06 = Color.fromRGBO(21, 93, 24, 1);

  static const red0 = Color.fromRGBO(253, 231, 230, 1);
  static const red03 = Color.fromRGBO(247, 113, 110, 1);
  static const red04 = Color.fromRGBO(245, 65, 61, 1);
  static const red05 = Color.fromRGBO(218, 16, 11, 1);
  static const red06 = Color.fromRGBO(145, 11, 8, 1);

  static const blueBG = Color.fromRGBO(250, 251, 253, 1);
  static const blue0 = Color.fromRGBO(225, 237, 252, 1);
  static const blue03 = Color.fromRGBO(80, 150, 241, 1);
  static const blue06 = Color.fromRGBO(10, 57, 119, 1);

  static const orange0 = Color.fromRGBO(252, 241, 227, 1);
  static const orange04 = Color.fromRGBO(237, 149, 38, 1);
  static const orange05 = Color.fromRGBO(191, 113, 15, 1);
  static const orange06 = Color.fromRGBO(127, 76, 10, 1);
}

class _Colors implements IColors {
  const _Colors();

  @override
  Color get defaultText => _IColors.black;

  @override
  Color get primaryText => _IColors.white;

  @override
  Color get primaryTitleText => _IColors.blue08;

  @override
  Color get primaryBackground => _IColors.red05;

  @override
  Color get secondaryBackground => _IColors.white;

  @override
  Color get subtitleText => _IColors.grey04;

  @override
  Color get selectedText => _IColors.blue05;

  @override
  Color get lightPrimaryBackground => _IColors.blue04;

  @override
  Color get disabledPrimaryBackground => _IColors.grey04;

  @override
  Color get foregroundColor => _IColors.grey05;

  @override
  Color get divider => _IColors.grey01;

  @override
  Color get disabledText => _IColors.grey02;

  @override
  Color get headerBackground => _IColors.blue01.withOpacity(0.5);

  @override
  Color get secondaryText => _IColors.white;

  @override
  Color get defaultBackground => _IColors.grey0;

  @override
  Color get defaultBorder => _IColors.grey03;

  @override
  Color get primaryBorder => _IColors.grey02;

  @override
  Color get successBackgroundColor => _IColors.green0;

  @override
  Color get successSecondaryColor => _IColors.green04;

  @override
  Color get successLeadingColor => _IColors.green05;

  @override
  Color get successPrimaryColor => _IColors.green06;

  @override
  Color get errorBackgroundColor => _IColors.red0;

  @override
  Color get errorSecondaryColor => _IColors.red04;

  @override
  Color get errorLeadingColor => _IColors.red05;

  @override
  Color get errorPrimaryColor => _IColors.red06;

  @override
  Color get errorLabel => _IColors.red04;

  @override
  Color get defaultHelper => _IColors.grey03;

  @override
  Color get errorBorder => _IColors.red03;

  static const _opacity = .5;

  @override
  Color get transparent => _IColors.transparent;

  @override
  Color get mainBackground => _IColors.blue05;

  @override
  Color get headerPrimaryBackground => _IColors.blue01.withOpacity(_opacity);

  @override
  Color get headerWarningBackground => _IColors.red0;

  @override
  Color get navItem => _IColors.grey06;

  @override
  Color get successBackground => _IColors.green0;

  @override
  Color get successLight => _IColors.green04;

  @override
  Color get successCaption => _IColors.green05;

  @override
  Color get successDark => _IColors.green06;

  @override
  Color get errorBackground => _IColors.red0;

  @override
  Color get errorLight => _IColors.red04;

  @override
  Color get errorCaption => _IColors.red05;

  @override
  Color get errorDark => _IColors.red06;

  @override
  Color get primaryLightBackground => _IColors.blueBG;

  @override
  Color get primaryDarkBackground => _IColors.blue04;

  @override
  Color get primaryLight => _IColors.blue03;

  @override
  Color get primaryCaption => _IColors.blue05;

  @override
  Color get primaryDark => _IColors.blue06;

  @override
  Color get warningBackground => _IColors.orange0;

  @override
  Color get warningLight => _IColors.orange04;

  @override
  Color get warningCaption => _IColors.orange05;

  @override
  Color get warningDark => _IColors.orange06;

  @override
  Color get secondaryLight => _IColors.grey01;

  @override
  Color get secondaryCaption => _IColors.grey05;

  @override
  Color get secondaryDark => _IColors.grey06;

  @override
  Color get cardHoverBorder => _IColors.blue05;

  @override
  Color get disabledNavItemBackground => _IColors.grey01;

  @override
  Color get shadow => _IColors.grey05.withOpacity(_opacity);

  @override
  Color get focusedBorder => _IColors.blue03;

  @override
  Color get defaultLabel => _IColors.grey06;

  @override
  Color get focusedLabel => _IColors.blue03;

  @override
  Color get successLabel => _IColors.green05;

  @override
  Color get successIcon => _IColors.green05;

  @override
  Color get errorIcon => _IColors.red06;

  @override
  Color get shimmerBase => _IColors.grey01;

  @override
  Color get shimmerHighlight => _IColors.grey0;
}

part of 'default_theme.dart';

abstract class _IColors {
  static const transparent = Color.fromRGBO(255, 255, 255, 0);

  static const black = Color.fromRGBO(0, 0, 0, 1);
  static const white = Color.fromRGBO(255, 255, 255, 1);

  static const grey01 = Color.fromRGBO(224, 224, 224, 1);
  static const grey02 = Color.fromRGBO(192, 192, 192, 1);
  static const grey03 = Color.fromARGB(255, 131, 131, 131);
  static const grey04 = Color.fromRGBO(129, 129, 129, 1);
  static const grey05 = Color.fromRGBO(99, 99, 99, 1);
  static const grey06 = Color.fromRGBO(65, 65, 65, 1);

  static const blue04 = Color.fromRGBO(22, 114, 236, 1);
  static const blue05 = Color(0xff139ae1);
  static const blue08 = Color.fromRGBO(10, 57, 119, 1);

  static const green0 = Color.fromRGBO(225, 248, 226, 1);
  static const green04 = Color.fromRGBO(42, 185, 48, 1);
  static const green05 = Color.fromRGBO(31, 139, 36, 1);
  static const green06 = Color.fromRGBO(21, 93, 24, 1);

  static const red0 = Color.fromRGBO(253, 231, 230, 1);
  static const red04 = Color.fromRGBO(245, 65, 61, 1);
  static const red05 = Color.fromRGBO(218, 16, 11, 1);
  static const red06 = Color.fromRGBO(145, 11, 8, 1);
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
  Color get secondaryText => _IColors.white;

  @override
  Color get defaultBorder => _IColors.grey03;

  @override
  Color get primaryBorder => _IColors.grey02;

  static const _opacity = .5;

  @override
  Color get transparent => _IColors.transparent;

  @override
  Color get mainBackground => _IColors.blue05;

  @override
  Color get headerPrimaryBackground => _IColors.grey02.withOpacity(_opacity);

  @override
  Color get headerWarningBackground => _IColors.red0;

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
  Color get secondaryLight => _IColors.grey01;

  @override
  Color get secondaryCaption => _IColors.grey05;

  @override
  Color get secondaryDark => _IColors.grey06;

  @override
  Color get cardHoverBorder => _IColors.blue05;

  @override
  Color get disabledNavItemBackground => _IColors.grey01;
}

part of 'default_theme.dart';

abstract class _IColors {
  static const black = Color.fromRGBO(0, 0, 0, 1);
  static const white = Color.fromRGBO(255, 255, 255, 1);

  static const grey02 = Color.fromRGBO(192, 192, 192, 1);
  static const grey04 = Color.fromRGBO(129, 129, 129, 1);
  static const grey06 = Color.fromRGBO(99, 99, 99, 1);
}

class _Colors implements IColors {
  const _Colors();

  @override
  Color get defaultText => _IColors.black;

  @override
  Color get secondaryBackground => _IColors.white;

  @override
  Color get subtitleText => _IColors.grey04;

  @override
  Color get disabledPrimaryBackground => _IColors.grey04;

  @override
  Color get foregroundColor => _IColors.grey06;

  @override
  Color get primaryBorder => _IColors.grey02;
}

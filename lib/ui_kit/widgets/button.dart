import 'package:bike_catalog/theme/theme.dart';
import 'package:bike_catalog/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

enum ButtonType {
  button,
  icon,
  fab,
}
enum ButtonStyleType {
  fill,
  outline,
  plain,
}

class Button extends StatelessWidget {
  Button({
    required ButtonType buttonType,
    required dynamic Function()? onTap,
    required bool isEnable,
    required bool isBusy,
    ButtonStyleType? styleType,
    double? width,
    double? height,
    ButtonStyle? style,
    String? title,
    IconData? icon,
    Key? key,
  })  : _buttonType = buttonType,
        _onTap = onTap,
        _isEnable = isEnable,
        _isBusy = isBusy,
        _styleType = styleType,
        _height = height,
        _width = width,
        _style = style,
        _title = title,
        _icon = icon,
        super(key: key) {
    final isNormalButton = buttonType == ButtonType.button;
    if (!isNormalButton && icon == null) {
      throw Exception('$buttonType(s) must have an icon');
    }
    if (isNormalButton && title == null) {
      throw Exception('$buttonType(s) must have a title');
    }
    if (styleType != null && style != null) {
      throw Exception('either style or styleType must be provided');
    }
  }

  factory Button.button({
    required String title,
    ButtonStyleType? styleType,
    dynamic Function()? onTap,
    bool? isEnable,
    bool? isBusy,
    double? width,
    double? height,
    IconData? icon,
  }) {
    return Button(
      buttonType: ButtonType.button,
      styleType: styleType ?? ButtonStyleType.fill,
      onTap: onTap,
      title: title,
      icon: icon,
      width: width,
      height: height,
      isEnable: isEnable ?? true,
      isBusy: isBusy ?? false,
    );
  }

  factory Button.fab({
    required IconData icon,
    ButtonStyleType? styleType,
    dynamic Function()? onTap,
    bool? isEnable,
    bool? isBusy,
  }) {
    return Button(
      buttonType: ButtonType.fab,
      styleType: styleType ?? ButtonStyleType.fill,
      icon: icon,
      onTap: onTap,
      width: _fabSize,
      height: _fabSize,
      isEnable: isEnable ?? true,
      isBusy: isBusy ?? false,
    );
  }

  factory Button.smallFab({
    required IconData icon,
    ButtonStyleType? styleType,
    dynamic Function()? onTap,
    bool? isEnable,
    bool? isBusy,
  }) {
    return Button(
      buttonType: ButtonType.fab,
      styleType: styleType ?? ButtonStyleType.fill,
      onTap: onTap,
      icon: icon,
      width: _smallFabSize,
      height: _smallFabSize,
      isEnable: isEnable ?? true,
      isBusy: isBusy ?? false,
    );
  }

  factory Button.icon({
    required IconData icon,
    dynamic Function()? onTap,
    bool? isEnable,
    bool? isBusy,
    double? size,
  }) {
    return Button(
      buttonType: ButtonType.icon,
      onTap: onTap,
      icon: icon,
      width: size,
      height: size,
      isEnable: isEnable ?? true,
      isBusy: isBusy ?? false,
    );
  }

  final ButtonType _buttonType;
  final bool _isEnable;
  final bool _isBusy;
  final dynamic Function()? _onTap;
  final ButtonStyleType? _styleType;
  final ButtonStyle? _style;
  final String? _title;
  final IconData? _icon;
  final double? _height;
  final double? _width;

  static const _smallFabSize = 40.0;
  static const _fabSize = 56.0;
  static const _defaultHeight = 48.0;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    final isDisabled = _isBusy || !_isEnable || _onTap == null;
    final VoidCallback? onPressed = isDisabled ? null : _onTap;

    return SizedBox(
      width: _width,
      height: _height ?? _defaultHeight,
      child: _buildButton(
        appTheme: appTheme,
        isDisabled: isDisabled,
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildButton({
    required IAppThemeData appTheme,
    required bool isDisabled,
    required Function()? onPressed,
  }) {
    switch (_buttonType) {
      case ButtonType.button:
        return _buttonBuilder(
          appTheme: appTheme,
          isDisabled: isDisabled,
          onPressed: onPressed,
        );
      case ButtonType.fab:
        return _fabButtonBuilder(
          appTheme: appTheme,
          isDisabled: isDisabled,
          onPressed: onPressed,
        );
      case ButtonType.icon:
        return _iconButtonBuilder(isDisabled);
    }
  }

  Widget _buttonBuilder({
    required IAppThemeData appTheme,
    required bool isDisabled,
    required Function()? onPressed,
  }) {
    final ButtonStyle buttonStyle;
    switch (_styleType) {
      case ButtonStyleType.fill:
        buttonStyle = isDisabled
            ? appTheme.disabledFilledButtonStyle
            : appTheme.filledButtonStyle;
        break;
      case ButtonStyleType.outline:
        buttonStyle = isDisabled
            ? appTheme.disabledOutlinedButtonStyle
            : appTheme.outlinedButtonStyle;
        break;
      case ButtonStyleType.plain:
        buttonStyle = isDisabled
            ? appTheme.disabledPlainButtonStyle
            : appTheme.plainButtonStyle;
        break;
      default:
        buttonStyle = isDisabled
            ? appTheme.disabledFilledButtonStyle
            : appTheme.filledButtonStyle;
    }
    return ElevatedButton(
      onPressed: onPressed,
      child: _buttonChild(
        appTheme: appTheme,
        isDisabled: isDisabled,
      ),
      style: _style ?? buttonStyle,
    );
  }

  Widget _fabButtonBuilder({
    required IAppThemeData appTheme,
    required bool isDisabled,
    required Function()? onPressed,
  }) {
    final ButtonStyle buttonStyle;
    switch (_styleType) {
      case ButtonStyleType.fill:
        buttonStyle = isDisabled
            ? appTheme.disabledFabFilledButtonStyle
            : appTheme.fabFilledButtonStyle;
        break;
      case ButtonStyleType.outline:
        buttonStyle = isDisabled
            ? appTheme.disabledFabOutlinedButtonStyle
            : appTheme.fabOutlinedButtonStyle;
        break;
      case ButtonStyleType.plain:
        buttonStyle = isDisabled
            ? appTheme.disabledFabPlainButtonStyle
            : appTheme.fabPlainButtonStyle;
        break;
      default:
        buttonStyle = isDisabled
            ? appTheme.disabledFabFilledButtonStyle
            : appTheme.fabFilledButtonStyle;
    }
    return ElevatedButton(
      onPressed: onPressed,
      child: _iconChild(),
      style: _style ?? buttonStyle,
    );
  }

  Widget _iconButtonBuilder(isDisabled) {
    const transparentHover = Colors.transparent;
    return AbsorbPointer(
      absorbing: isDisabled,
      child: IconButton(
        onPressed: _onTap,
        icon: _iconChild(),

        /// setting these properties will remove hover effect
        highlightColor: transparentHover,
        splashColor: transparentHover,
        hoverColor: transparentHover,
      ),
    );
  }

  Widget _iconChild() {
    return _isBusy ? const Loading() : Icon(_icon);
  }

  Widget _buttonChild({
    required IAppThemeData appTheme,
    required bool isDisabled,
  }) {
    final buttonText = Text(_title ?? '');
    const iconMargin = EdgeInsets.only(right: 12);
    return _isBusy
        ? const Loading()
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (_icon != null)
                Container(
                  margin: iconMargin,
                  child: Icon(_icon!),
                ),
              buttonText,
            ],
          );
  }
}

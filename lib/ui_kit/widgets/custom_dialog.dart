import 'package:flutter/material.dart';

import 'package:bikes/constants/constants.dart';
import 'package:bikes/theme/theme.dart';
import 'package:bikes/ui_kit/helpers/enum_helper.dart';
import 'package:bikes/ui_kit/ui_kit.dart';

enum DialogActionType {
  ok,
  cancel,
  yes,
  no,
}

class CustomDialog extends StatelessWidget {
  CustomDialog({
    required ComponentStyle dialogStyle,
    String? title,
    Widget? header,
    Widget? body,
    Widget? image,
    List<DialogAction>? actions,
    double? width,
    double? maxHeight,
    Alignment alignment = Alignment.topCenter,
    bool isEnable = true,
    Key? key,
  })  : _title = title,
        _header = header,
        _image = image,
        _body = body,
        _actions = actions,
        _height = maxHeight,
        _width = width,
        _isEnable = isEnable,
        _alignment = alignment,
        _dialogStyle = dialogStyle,
        assert(
          header != null || (title != null && title.isNotEmpty),
          Api.customDialogException,
        ),
        super(key: key);

  final String? _title;
  final Widget? _header;
  final Widget? _body;
  final Widget? _image;
  final List<DialogAction>? _actions;
  final double? _height;
  final double? _width;
  final Alignment _alignment;
  final bool _isEnable;
  final ComponentStyle _dialogStyle;

  static const _titlePadding = EdgeInsets.symmetric(
    vertical: 14,
    horizontal: 16,
  );
  static const _leftSidePadding = EdgeInsets.only(
    left: 14,
    right: 16,
  );
  static const _bodyPadding = 16.0;
  static const _actionsHorizontalSpacing = 16.0;
  static const _leftSideWidth = 152.95;
  static const _closeButtonMargin = 6.0;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return Padding(
      padding: const EdgeInsets.all(_bodyPadding),
      child: Align(
        alignment: _alignment,
        child: Material(
          shape: appTheme.dialogShapeBorder,
          child: Container(
            width: _width,
            constraints:
                _height != null ? BoxConstraints(maxHeight: _height!) : null,
            child: _buildDialog(
              appTheme: appTheme,
              context: context,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDialog({
    required BuildContext context,
    required IAppThemeData appTheme,
  }) {
    final padding = MediaQuery.of(context).viewInsets;
    return SingleChildScrollView(
      reverse: true,
      child: Padding(
        padding: padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(appTheme),
            _buildBody(),
            if (_actions != null && _actions!.isNotEmpty) _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(IAppThemeData appTheme) {
    final decorationData = _getHeaderDecorationData(
      appTheme: appTheme,
      dialogStyle: _dialogStyle,
    );
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: decorationData.decoration,
      child: _header != null
          ? _header!
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: _titlePadding,
                  child: Label(
                    _title!,
                    typography: TypographyFamily.headline7,
                    color: decorationData.titleColor,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: _closeButtonMargin),
                  child: CloseButton(
                    color: appTheme.colors.secondaryCaption,
                  ),
                ),
              ],
            ),
    );
  }

  DialogTypeData _getHeaderDecorationData({
    required IAppThemeData appTheme,
    required ComponentStyle dialogStyle,
  }) {
    switch (dialogStyle) {
      case ComponentStyle.error:
        return DialogTypeData(
          decoration: appTheme.dialogHeaderErrorDecoration,
          titleColor: appTheme.colors.errorCaption,
        );
      default:
        return DialogTypeData(
          decoration: appTheme.dialogHeaderPrimaryDecoration,
          titleColor: appTheme.colors.primaryTitleText,
        );
    }
  }

  Widget _buildBody() => Container(
        padding: (_image != null || (_actions != null && _actions!.isNotEmpty))
            ? const EdgeInsets.all(_bodyPadding)
            : const EdgeInsets.symmetric(vertical: _bodyPadding),
        child: Row(
          children: [
            if (_image != null) _imageBuilder(),
            if (_body != null) Flexible(child: _body!),
          ],
        ),
      );

  Widget _imageBuilder() => Container(
        width: _leftSideWidth,
        padding: _leftSidePadding,
        child: _image,
      );

  Widget _buildFooter() => Column(
        children: [
          LineDivider.horizontal(),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(_bodyPadding),
              child: Wrap(
                alignment: WrapAlignment.end,
                spacing: _actionsHorizontalSpacing,
                children: _actionWidgetsBuilder(),
              ),
            ),
          ),
        ],
      );

  List<Widget> _actionWidgetsBuilder() {
    final actionWidgets = <Widget>[];
    for (var action in _actions!) {
      final actionButton = Button(
        title: action.title,
        onTap: action.onAction,
        isEnable: _isEnable,
        isBusy: action.isBusy,
        buttonType: action.buttonKind,
        styleType: action.buttonStyleType,
      );
      actionWidgets.add(actionButton);
    }
    return actionWidgets;
  }
}

class DialogAction {
  DialogAction({
    required this.type,
    required this.isBusy,
    required this.title,
    required this.onAction,
    required this.buttonKind,
    required this.buttonStyleType,
  });

  factory DialogAction.ok({
    required dynamic Function() onAction,
    ButtonType? buttonKind,
    ButtonStyleType? buttonStyleType,
    bool? isBusy,
  }) {
    return DialogAction(
        type: DialogActionType.ok,
        onAction: onAction,
        title: EnumHelpers.humanize(DialogActionType.ok),
        isBusy: isBusy ?? false,
        buttonKind: buttonKind ?? ButtonType.button,
        buttonStyleType: buttonStyleType ?? ButtonStyleType.fill);
  }

  factory DialogAction.cancel({
    required dynamic Function() onAction,
    ButtonType? buttonKind,
    ButtonStyleType? buttonStyleType,
    bool? isBusy,
  }) {
    return DialogAction(
        type: DialogActionType.cancel,
        onAction: onAction,
        title: EnumHelpers.humanize(DialogActionType.cancel),
        isBusy: isBusy ?? false,
        buttonKind: buttonKind ?? ButtonType.button,
        buttonStyleType: buttonStyleType ?? ButtonStyleType.outline);
  }

  final DialogActionType type;
  final String title;
  final dynamic Function() onAction;
  final bool isBusy;
  final ButtonType buttonKind;
  final ButtonStyleType buttonStyleType;
}

class DialogTypeData {
  DialogTypeData({
    required this.decoration,
    required this.titleColor,
  });

  final Decoration decoration;
  final Color titleColor;
}

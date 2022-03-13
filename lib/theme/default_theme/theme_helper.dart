part of 'default_theme.dart';

MaterialStateProperty<Color?>? _materialStateColorBuilder({
  required Color hoverColor,
  required Color color,
}) =>
    MaterialStateProperty.resolveWith<Color>(
      (states) {
        if (states.contains(MaterialState.hovered)) {
          return hoverColor;
        }
        return color;
      },
    );

MaterialStateProperty<TextStyle?>? _textStyleBuilder(
  textStyle,
) =>
    MaterialStateProperty.all<TextStyle>(textStyle);

MaterialStateProperty<OutlinedBorder?>? _filledButtonShapeBuilder(
  borderRadius,
) =>
    MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );

MaterialStateProperty<OutlinedBorder?>? _outlinedButtonShapeBuilder({
  required double borderRadius,
  required Color borderColor,
  required Color hoverBorderColor,
}) =>
    MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.hovered)) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: hoverBorderColor),
          );
        }
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(color: borderColor),
        );
      },
    );

MaterialStateProperty<EdgeInsetsGeometry?>? _buttonPaddingBuilder(
  EdgeInsets padding,
) =>
    MaterialStateProperty.all<EdgeInsetsGeometry>(padding);

MaterialStateProperty<MouseCursor?>? _disabledButtonsMouseCursorBuilder() =>
    MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.hovered)) {
          return SystemMouseCursors.click;
        }
        return SystemMouseCursors.basic;
      },
    );

MaterialStateProperty<double?>? _buttonElevationBuilder(
  double elevation,
) =>
    MaterialStateProperty.all<double>(elevation);

MaterialStateProperty<double?>? _buttonElevationBuilderWithHover({
  required double hoverElevation,
  required double elevation,
}) =>
    MaterialStateProperty.resolveWith<double>(
      (states) {
        if (states.contains(MaterialState.hovered)) {
          return hoverElevation;
        }
        return elevation;
      },
    );

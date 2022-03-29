import 'package:bikes/theme/theme.dart';
import 'package:flutter/material.dart';

@immutable
class AppTheme extends InheritedWidget {
  const AppTheme({
    required IAppThemeData appThemeData,
    required child,
    Key? key,
  })  : _theme = appThemeData,
        super(
          key: key,
          child: child,
        );

  final IAppThemeData _theme;

  IAppThemeData get theme => _theme;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return (oldWidget as AppTheme).theme != theme;
  }

  static AppTheme of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    assert(theme != null, 'AppTheme should be provided');
    return theme!;
  }
}

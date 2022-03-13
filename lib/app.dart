import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'package:bike_catalog/services/navigation/navigation.dart';
import 'package:bike_catalog/theme/theme.dart';

@singleton
class App extends StatelessWidget {
  const App({
    required AppRouter appRouter,
    required IAppThemeData appThemeData,
    Key? key,
  })  : _appRouter = appRouter,
        _appThemeData = appThemeData,
        super(key: key);

  final AppRouter _appRouter;
  final IAppThemeData _appThemeData;

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      appThemeData: _appThemeData,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}

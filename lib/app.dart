import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:bikes/services/services.dart';
import 'package:bikes/theme/theme.dart';

@singleton
class App extends StatelessWidget {
  const App({
    required AppRouter appRouter,
    required IAppThemeData appThemeData,
    required ApplicationService appService,
    Key? key,
  })  : _appRouter = appRouter,
        _appThemeData = appThemeData,
        _appService = appService,
        super(key: key);

  final AppRouter _appRouter;
  final IAppThemeData _appThemeData;
  final ApplicationService _appService;

  @override
  Widget build(BuildContext context) {
    // To disable landscape mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return BlocProvider(
      create: (_) => _appService,
      child: AppTheme(
        appThemeData: _appThemeData,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
        ),
      ),
    );
  }
}

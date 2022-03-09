import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'package:bike_catalog/services/navigation/navigation.dart';

@injectable
class App extends StatelessWidget {
  const App({
    required AppRouter appRouter,
    Key? key,
  })  : _appRouter = appRouter,
        super(key: key);

  final AppRouter _appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}

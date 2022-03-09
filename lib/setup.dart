import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:bike_catalog/services/navigation/navigation.dart';
import 'package:bike_catalog/setup.config.dart';
import 'package:bike_catalog/theme/theme.dart';

final getIt = GetIt.instance;

void configureDependencies() => $initGetIt(getIt);

T locateService<T extends Object>() => getIt.get<T>();

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
@module
abstract class RegisterModule {
  static final _appRouter = AppRouter();
  final _navigationService = NavigationService(_appRouter.navigatorKey);

  @Injectable(as: Key)
  UniqueKey get key;

  @singleton
  INavigationService get navigationService => _navigationService;

  @singleton
  AppRouter get appRouter => _appRouter;

  @singleton
  IAppThemeData get theme => DefaultTheme();
}

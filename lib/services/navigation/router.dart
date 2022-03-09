import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bike_catalog/screens/bikes/bikes_screen_v.dart';

import 'package:bike_catalog/screens/splash/splash_screen_v.dart';

export 'router.gr.dart';

abstract class Routes {
  static const splash = '/splash';
  static const bikes = '/bikes';
}

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashScreen,
      path: Routes.splash,
      initial: true,
    ),
    AutoRoute(
      page: BikesScreen,
      path: Routes.bikes,
    ),
    RedirectRoute(path: '*', redirectTo: '/')
  ],
)
class $AppRouter {}

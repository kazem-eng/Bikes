import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';

import 'package:bike_catalog/screens/splash/splash_screen_v.dart';

export 'router.gr.dart';

abstract class Routes {
  static const splash = '/splash';
}

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashScreen,
      path: Routes.splash,
      initial: true,
    ),
    RedirectRoute(path: '*', redirectTo: '/')
  ],
)
class $AppRouter {}

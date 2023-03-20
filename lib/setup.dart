import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

import 'package:bikes/services/services.dart';
import 'package:bikes/setup.config.dart';
import 'package:bikes/theme/theme.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBoQQ6SIajWyCBuBVpC-dgtx735LyohzoQ',
      appId: '1:726900179362:web:09c143cc7b8aeff6d9b2fb',
      messagingSenderId: '726900179362',
      projectId: 'bikes-9bece',
      authDomain: 'bikes-9bece.firebaseapp.com',
    ),
  );
  $initGetIt(getIt);
}

T locateService<T extends Object>() => getIt.get<T>();

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
@module
abstract class RegisterModule {
  static final _appRouter = AppRouter();
  final _defauldTheme = DefaultTheme();
  final _client = Client();

  final _navigationService =
      NavigationService(navigatorKey: _appRouter.navigatorKey);

  @Injectable(as: Key)
  UniqueKey get key;

  @singleton
  INavigationService get navigationService => _navigationService;

  @singleton
  AppRouter get appRouter => _appRouter;

  @singleton
  IAppThemeData get theme => _defauldTheme;

  @singleton
  INetworkService get network => NetworkCall(client: _client);

  @singleton
  IAuthService get authService {
    if (kIsWeb) {
      return FirebaseAuthService(
        firebaseAuth: FirebaseAuth.instance,
        googleSignIn: GoogleSignIn(
          clientId:
              '726900179362-qv3co7klha151k9ovs35r39n54s0mduo.apps.googleusercontent.com',
          serverClientId:
              'com.googleusercontent.apps.726900179362-qv3co7klha151k9ovs35r39n54s0mduo',
          scopes: ['email'],
        ),
      );
    }
    if (Platform.isIOS) {
      final googleSignIn = GoogleSignIn(
        clientId:
            '726900179362-qv3co7klha151k9ovs35r39n54s0mduo.apps.googleusercontent.com',
        serverClientId:
            'com.googleusercontent.apps.726900179362-qv3co7klha151k9ovs35r39n54s0mduo',
        scopes: ['email'],
      );
      return FirebaseAuthService(
        firebaseAuth: FirebaseAuth.instance,
        googleSignIn: googleSignIn,
      );
    }
    final googleSignIn = GoogleSignIn(
      clientId:
          '726900179362-a4rcdscgivcbd165co757lrbcrvt0pnm.apps.googleusercontent.com',
      scopes: ['email'],
    );
    return FirebaseAuthService(
      firebaseAuth: FirebaseAuth.instance,
      googleSignIn: googleSignIn,
    );
  }

  @singleton
  AppViewModel get appState => AppViewModel(authenticationService: authService);
}

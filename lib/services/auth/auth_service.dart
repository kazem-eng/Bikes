import 'dart:async';

import 'package:bikes/models/models.dart';

enum AuthenticationStatus {
  busy,
  authenticated,
  unauthenticated,
}

abstract class IAuthService {
  User? get userInfo;
  StreamController get controller;
  bool get isLoggedIn;
  Future<User?> get currentUser;
  Future<User?> signInWithGoogleAccount();
  Future<void> signOut();
}

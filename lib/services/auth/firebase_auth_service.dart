import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:bikes/models/models.dart';
import 'package:bikes/services/services.dart';

class FirebaseAuthService implements IAuthService {
  FirebaseAuthService({
    required firebase.FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
  })  : _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn;

  final firebase.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  User? _user;

  @override
  StreamController controller = StreamController<AuthenticationStatus>();

  @override
  User? userInfo;

  @override
  Future<User?> get currentUser async {
    if (_firebaseAuth.currentUser != null && _user == null) {
      final userWithName = User(
        id: _firebaseAuth.currentUser!.uid,
        email: _user!.email,
        name: _firebaseAuth.currentUser!.displayName,
        profileImageUrl: _firebaseAuth.currentUser!.photoURL,
      );
      userInfo = userWithName;
      return userWithName;
    } else {
      return userInfo;
    }
  }

  @override
  Future<User?> signInWithGoogleAccount() async {
    controller.add(AuthenticationStatus.busy);
    if (kIsWeb) {
      var authProvider = firebase.GoogleAuthProvider();
      await _firebaseAuth.signInWithPopup(authProvider);
    } else {
      final googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final firebase.AuthCredential credential =
            firebase.GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        await _firebaseAuth.signInWithCredential(credential);
      } else {
        await _firebaseAuth.signOut();
      }
    }
    if (_firebaseAuth.currentUser != null) {
      userInfo = await currentUser;
      controller.add(AuthenticationStatus.authenticated);
      return userInfo;
    } else {
      controller.add(AuthenticationStatus.unauthenticated);
      userInfo = null;
      await signOut();
      return null;
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    if (!kIsWeb) {
      await _googleSignIn.signOut();
    }
    controller.add(AuthenticationStatus.unauthenticated);
    userInfo = null;
    _user = null;
  }

  @override
  bool get isLoggedIn => _firebaseAuth.currentUser != null;

  void dispose(filename) => controller.close();
}

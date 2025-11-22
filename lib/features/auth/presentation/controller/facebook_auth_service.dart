import 'package:dartz/dartz.dart';
import 'package:easacc/core/errors/app_failure.dart';
import 'package:easacc/core/services/cache/shared_preferences_service.dart';
import 'package:easacc/core/services/cache/shared_prefs_keys.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookAuthService {
  FacebookAuthService._privateConstructor();

  static final FacebookAuthService instance =
      FacebookAuthService._privateConstructor();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// Sign in with Facebook and link to Firebase
  Future<Either<AppFailure, UserCredential>> signInWithFacebook() async {
    try {
      final loginResult = await FacebookAuth.instance.login(
        permissions: ['email', 'public_profile'],
      );

      if (loginResult.status == LoginStatus.cancelled) {
        return left(
          const UnexpectedFailure('Facebook login cancelled by user'),
        );
      } else if (loginResult.status == LoginStatus.failed) {
        return left(
          UnexpectedFailure('Facebook login failed: ${loginResult.message}'),
        );
      }

      final accessToken = loginResult.accessToken!;

      final facebookAuthCredential = FacebookAuthProvider.credential(
        accessToken.tokenString,
      );

      final userCredential = await _firebaseAuth.signInWithCredential(
        facebookAuthCredential,
      );

      _saveUserCredential(userCredential);

      return right(userCredential);
    } catch (e) {
      return left(const UnexpectedFailure('Facebook sign-in failed'));
    }
  }

  void _saveUserCredential(UserCredential credential) {
    SharedPreferencesService.saveData(
      key: SharedPrefsKeys.userID,
      value: credential.user?.uid,
    );
    SharedPreferencesService.saveData(
      key: SharedPrefsKeys.isLoggedIn,
      value: true,
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await FacebookAuth.instance.logOut();
    await SharedPreferencesService.removeData(key: SharedPrefsKeys.userID);
    await SharedPreferencesService.removeData(key: SharedPrefsKeys.isLoggedIn);
  }
}

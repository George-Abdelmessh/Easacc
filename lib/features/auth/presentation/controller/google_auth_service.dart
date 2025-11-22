import 'package:dartz/dartz.dart';
import 'package:easacc/core/errors/app_failure.dart';
import 'package:easacc/core/services/cache/shared_preferences_service.dart';
import 'package:easacc/core/services/cache/shared_prefs_keys.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  GoogleAuthService._privateConstructor();

  static final GoogleAuthService instance =
      GoogleAuthService._privateConstructor();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  /// Sign in with Google and link the account to Firebase
  Future<Either<AppFailure, UserCredential>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.authenticate();

      final googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.idToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _firebaseAuth.signInWithCredential(
        credential,
      );

      _saveUserCredential(userCredential);

      return right(userCredential);
    } catch (e) {
      return left(const UnexpectedFailure('Google sign-in failed'));
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

  /// Sign out from both Firebase and Google
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
    await SharedPreferencesService.removeData(key: SharedPrefsKeys.userID);
    await SharedPreferencesService.removeData(key: SharedPrefsKeys.isLoggedIn);
  }
}

import 'package:fl_examen_final/auth/database_user.dart';
import 'package:fl_examen_final/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import "package:fl_examen_final/models/user.dart" as umodel;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Expose the auth state changes stream
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final userCred =
        await FirebaseAuth.instance.signInWithCredential(credential);

    if (userCred.user != null) {
      if (await userExists(userCred.user!.uid)) {
        return userCred;
      } else {
        await registerUser(
          umodel.User(
              uid: userCred.user!.uid,
              admin: false,
              name: userCred.user!.displayName ?? ''),
        );
      }
    }

    return userCred;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}

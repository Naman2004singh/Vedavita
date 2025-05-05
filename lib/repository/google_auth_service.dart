import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  final googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'profile',
    ],
  );

  Future<String?> signInWithGoogle() async {
    final account = await googleSignIn.signIn();
    if (account == null) {
      throw Exception('Google sign-in failed');
    }
    final auth = await account.authentication;
    return auth.idToken;
  }

  Future<void> signOut() async {
    await googleSignIn.signOut();
  }
}

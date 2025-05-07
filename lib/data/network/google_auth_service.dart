import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  final googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'profile',
      ],
      clientId:
          "381422012652-qnp4qlce4nqr5qpovb9tdhrljkdqep65.apps.googleusercontent.com"
          );

  Future<String?> signInWithGoogle() async {
    await googleSignIn.signOut(); // Sign out any existing user

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

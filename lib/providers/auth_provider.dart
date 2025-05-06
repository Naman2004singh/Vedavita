import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vedavita/repository/google_auth_service.dart';
import 'package:vedavita/repository/repository.dart';

// register
final nameProvider = StateProvider<String?>(
  (ref) => '',
);
final emailProviderRegister = StateProvider<String?>(
  (ref) => '',
);
final passwordProviderRegister = StateProvider<String?>(
  (ref) => '',
);
final registerLoadingProvider = StateProvider<bool>((ref) => false);

//login
final emailProviderLogin = StateProvider<String?>(
  (ref) => '',
);
final passwordProviderLogin = StateProvider<String?>(
  (ref) => '',
);
final loginLodingProvider = StateProvider<bool>(
  (ref) => false,
);

// navigation provider of navigation bar
final navigationProvider = StateProvider<int>((ref) => 0);

// google auth provider

// google auth provider

final googleAuthServiceProvider = Provider((ref) => GoogleAuthService());

final googleAuthRepositoryProvider = Provider((ref) {
  return (String token) async {
    final response = await Repository().googleAuth(token);
    return response;
  };
});

final googleAuthFlowProvider = FutureProvider((ref) async {
  final googleAuthService = ref.read(googleAuthServiceProvider);
  final apiCall = ref.read(googleAuthRepositoryProvider);

  final idToken = await googleAuthService.signInWithGoogle();
  if (idToken == null) throw Exception('Google Sign-In failed');

  final response = await apiCall(idToken);
  print(response);
  print(idToken);

  return response;
});

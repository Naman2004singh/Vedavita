import 'package:flutter_riverpod/flutter_riverpod.dart';

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

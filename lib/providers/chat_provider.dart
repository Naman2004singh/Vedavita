import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vedavita/notifiers/chat_notifiers.dart';
import 'package:vedavita/repository/features_repository.dart';

final chatRepositoryProvider = Provider<ChatRepository>((ref) {
  return ChatRepository();
});


//state notifier provider
final chatProvider = StateNotifierProvider<ChatNotifier, ChatState>((ref) {
  final repository = ref.watch(chatRepositoryProvider);
  return ChatNotifier(repository);
});
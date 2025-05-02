import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vedavita/models/chat_message.dart';
import 'package:vedavita/repository/repository.dart';

final chatRepositoryProvider = Provider<ChatRepository>((ref) {
  return ChatRepository();
});

class ChatRepository {
}

// State class
class ChatState {
  final List<ChatMessage> messages;
  final bool isLoading;
  final String? error;

  ChatState({
    required this.messages,
    required this.isLoading,
    this.error,
  });

  ChatState copyWith({
    List<ChatMessage>? messages,
    bool? isLoading,
    String? error,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

// StateNotifier - handles complex state management
class ChatNotifier extends StateNotifier<ChatState> {
  final ChatRepository _repository;

  ChatNotifier(this._repository)
      : super(ChatState(messages: [], isLoading: false));

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    // Add user message to state
    final userMessage = ChatMessage(
      text: text,
      isUser: true,
      timestamp: DateTime.now(),
    );

    state = state.copyWith(
      messages: [...state.messages, userMessage],
      isLoading: true,
      error: null,
    );

    try {
      // Call repository to send message to API
      final response = await Repository().sendMessage(text);

      if (response.success) {
        // Add bot response to state
        final botMessage = ChatMessage(
          text: response.data,
          isUser: false,
          timestamp: DateTime.now(),
        );

        state = state.copyWith(
          messages: [...state.messages, botMessage],
          isLoading: false,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          error: response.message,
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  void clearChat() {
    state = ChatState(messages: [], isLoading: false);
  }

  void dismissError() {
    state = state.copyWith(error: null);
  }
}

//state notifier provider
final chatProvider = StateNotifierProvider<ChatNotifier, ChatState>((ref) {
  final repository = ref.watch(chatRepositoryProvider);
  return ChatNotifier(repository);
});
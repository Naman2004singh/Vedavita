import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vedavita/providers/chat_provider.dart';
import 'package:vedavita/views/chatbot/widget/chat_bubble.dart';
import 'package:vedavita/views/chatbot/widget/chat_input.dart';
import 'package:vedavita/views/chatbot/widget/empty_placeholder.dart';
import 'package:vedavita/views/chatbot/widget/error_banner.dart';

class ChatScreen extends ConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatState = ref.watch(chatProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Assistant'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(chatProvider.notifier).clearChat();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Error message if any
          if (chatState.error != null)
            ErrorBanner(errorMessage: chatState.error!),
          
          // Chat messages
          Expanded(
            child: chatState.messages.isEmpty
                ? const EmptyChatPlaceholder()
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: chatState.messages.length,
                    itemBuilder: (context, index) {
                      final message = chatState.messages[index];
                      return ChatBubble(message: message);
                    },
                  ),
          ),
          
          // Loading indicator
          if (chatState.isLoading)
            const LinearProgressIndicator(),
          
          // Chat input
          const ChatInput(),
        ],
      ),
    );
  }
}
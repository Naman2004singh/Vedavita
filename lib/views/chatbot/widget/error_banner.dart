import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vedavita/providers/chat_provider.dart';

class ErrorBanner extends ConsumerWidget {
  final String errorMessage;

  const ErrorBanner({
    super.key,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.red.shade100,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: Colors.red.shade800),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              errorMessage,
              style: TextStyle(color: Colors.red.shade800),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              ref.read(chatProvider.notifier).dismissError();
            },
          ),
        ],
      ),
    );
  }
}
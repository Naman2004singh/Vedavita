import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vedavita/providers/chat_provider.dart';
import 'package:vedavita/utils/app_colors.dart';

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
          const Icon(Icons.error_outline, color: AppColors.redColor),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              errorMessage,
              style: const TextStyle(color: AppColors.redColor),
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
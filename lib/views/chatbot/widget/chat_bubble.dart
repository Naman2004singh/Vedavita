import 'package:flutter/material.dart';
import 'package:vedavita/models/chat_message.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:vedavita/utils/app_colors.dart';
import 'package:vedavita/utils/app_constants.dart';
import 'package:vedavita/utils/app_textstyle.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth =  AppConstants.screenWidth(context);
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth:  screenWidth* 0.75,
        ),
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color:
              message.isUser ? AppColors.mainColor : AppColors.lightChatColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            message.isUser
                ? Text(
                    message.text,
                    style: AppTextstyle.text17W,
                  )
                : MarkdownBody(  //this will structure the response of the chatbot
                    data: message.text,
                    styleSheet: MarkdownStyleSheet(
                      p: AppTextstyle.text17B,
                      strong: AppTextstyle.text17B,
                      listBullet: AppTextstyle.text17B,
                    ),
                  ),
            const SizedBox(height: 4),
            Text(
              formatTime(message.timestamp),
              style: TextStyle(
                color: message.isUser ? Colors.white70 : Colors.black54,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatTime(DateTime dateTime) {
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}

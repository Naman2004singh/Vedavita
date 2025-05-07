import 'dart:io';
import 'package:vedavita/data/network/network_api_service.dart';
import 'package:vedavita/models/chat_response_model.dart';
import 'package:vedavita/utils/app_urls.dart';

class ChatRepository {
  final _api = NetworkApiService();

  // chatbot api
  Future<ChatResponseModel> sendMessage(String message) async {
    final response = await _api.postApi(
      AppUrls.chatbotUrl,
      {'text': message},
    );
    return ChatResponseModel.fromJson(response);
  }
}

class ImageRepository {
  final _api = NetworkApiService();

  // image api
  Future<ChatResponseModel> uploadImage(File imageFile) async {
    final response = await _api.uploadImageOnly(
      AppUrls.uploadImageUrl,
      imageFile,
    );

    return ChatResponseModel.fromJson(response);
  }
}

import 'package:vedavita/data/network/network_api_service.dart';
import 'package:vedavita/models/chat_response_model.dart';
import 'package:vedavita/utils/app_urls.dart';

class Repository {
  final _api = NetworkApiService();

  Future<ChatResponseModel> sendMessage(String message) async {
    final response = await _api.postApi(
      AppUrls.chatbotUrl,
      {'text': message},
    );
    return ChatResponseModel.fromJson(response);
  }
}

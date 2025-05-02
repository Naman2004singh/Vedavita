import 'package:vedavita/data/network/network_api_service.dart';
import 'package:vedavita/models/auth/login_model.dart';
import 'package:vedavita/models/auth/register_model.dart';
import 'package:vedavita/models/chat_response_model.dart';
import 'package:vedavita/utils/app_urls.dart';

class Repository {
  final _api = NetworkApiService();

   // register api
  Future<RegisterResponse> registerApi(dynamic data) async {
    final response = await _api.postApi(AppUrls.registerUrl, data);
    return RegisterResponse.fromJson(response);
  }

  // login api
  Future<LoginResponse> loginApi(dynamic data) async {
    final response = await _api.postApi(AppUrls.loginUrl, data);
    return LoginResponse.fromJson(response);
  }

  Future<ChatResponseModel> sendMessage(String message) async {
    final response = await _api.postApi(
      AppUrls.chatbotUrl,
      {'text': message},
    );
    return ChatResponseModel.fromJson(response);
  }
}

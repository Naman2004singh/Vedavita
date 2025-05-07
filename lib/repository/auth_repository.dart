import 'package:vedavita/data/network/network_api_service.dart';
import 'package:vedavita/data/network/token_storage.dart';
import 'package:vedavita/models/auth/login_model.dart';
import 'package:vedavita/models/auth/register_model.dart';
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
    final loginResponse = LoginResponse.fromJson(response);

    final dataField = loginResponse.data;

    if (dataField != null &&
        dataField.accessToken != null &&
        dataField.refreshToken != null) {
      await TokenStorage.storeTokens(
        dataField.accessToken!,
        dataField.refreshToken!,
      );
      // print("loginResponse: $loginResponse");
    }

    return loginResponse;
  }

  // google login api
  Future<dynamic> googleAuth(String idToken) async{
    final response = await _api.postApi(AppUrls.googleAuthUrl, {"idToken": idToken});
    return response;
  }
  
}

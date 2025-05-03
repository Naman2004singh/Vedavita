import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:vedavita/data/exception/app_exceptions.dart';
import 'package:vedavita/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;
import 'package:vedavita/data/network/token_storage.dart';

class NetworkApiService extends BaseApiService {
  // GET api call
  @override
  Future<dynamic> getApi(String url) async {
    dynamic jsonResponse;

    try {
       final token = await TokenStorage.getAccessToken();
      final response =
          await http.get(Uri.parse(url), headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },).timeout(const Duration(seconds: 50));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw NoInternetException('message');
    } on TimeoutException {
      throw RequestTimeOutException('message');
    }
    return jsonResponse;
  }

  // POST api call
  @override
  Future<dynamic> postApi(String url, var data) async {
    dynamic jsonResponse;

    try {
      final response = await http
          .post(Uri.parse(url),
              headers: {'Content-Type': 'application/json'},
              body: jsonEncode(data))
          .timeout(const Duration(seconds: 50));

      jsonResponse = returnResponse(response);

      // storing the token
      if (jsonResponse['accessToken'] != null &&
          jsonResponse['refreshToken'] != null) {
        await TokenStorage.storeTokens(
          jsonResponse['accessToken'],
          jsonResponse['refreshToken'],
        );
        print("jsonResponse :${jsonResponse}");
      }
    } on SocketException {
      throw NoInternetException('message');
    } on TimeoutException {
      throw RequestTimeOutException('message');
    }
    return jsonResponse;
  }

  // Post api for the file upload

  Future<dynamic> uploadImageOnly(String url, File imageFile) async {
    dynamic jsonResponse;
    try {
      final request = http.MultipartRequest(
          'POST',
          Uri.parse(
            url,
          ));

      final token = await TokenStorage.getAccessToken();
      if (token != null && token.isNotEmpty) {
        request.headers['Authorization'] = 'Bearer $token';
        print('Image upload using token: $token');
      } else {
        print('No token found for image upload');
      }
      // Get file extension
      // final fileExtension = extension(imageFile.path).replaceAll('.', '');

      // Add the image file
      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          imageFile.path,
          // ContentType(
          //   'image',
          //   fileExtension,
          // ),
        ),
      );

      print('Request headers: ${request.headers}');

      // Send the request
      final streamedResponse =
          await request.send().timeout(const Duration(seconds: 60));

      final response = await http.Response.fromStream(streamedResponse);

      jsonResponse = returnResponse(response);
    } on SocketException {
      throw NoInternetException('No internet connection');
    } on TimeoutException {
      throw RequestTimeOutException('Request timeout');
    }
    return jsonResponse;
  }

  // Managing the status codes

  dynamic returnResponse(http.Response response) {
    // print("STATUS: ${response.statusCode}");
    // print("BODY: ${response.body}");

    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 201:
        return jsonDecode(response.body);
      // case 400:
      //   return jsonDecode(response.body);
      case 401:
        throw UnAuthorizedException("Unauthorized");
      case 404:
        throw FetchDataException("${response.statusCode} : Not found");
      case 500:
        throw FetchDataException(
            "Internal server error :${response.statusCode}");
      case 409:
        throw FetchDataException(
            "${response.statusCode} conflict : user already register");
      default:
        throw FetchDataException(
            "Unexpected status code: ${response.statusCode}");
    }
  }
}

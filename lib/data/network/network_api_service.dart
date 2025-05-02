import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:vedavita/data/exception/app_exceptions.dart';
import 'package:vedavita/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {
  // GET api call
  @override
  Future<dynamic> getApi(String url) async {
    dynamic jsonResponse;

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 50));
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
    } on SocketException {
      throw NoInternetException('message');
    } on TimeoutException {
      throw RequestTimeOutException('message');
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

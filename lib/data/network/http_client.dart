import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_template/constants/env_config.dart';
import 'package:flutter_template/data/network/network_exceptions.dart';

class HttpClient {
  final String _apiUrl = API_URL!;
  final String _apiToken = API_KEY!;

  Future<dynamic> get(String url, Map<String, String> queryParams) async {
    String responseJson;
    try {
      final uri = Uri.https(_apiUrl, url, queryParams);
      final response = await http.get(uri, headers: {
        "X-Api-Key": _apiToken,
      });
      responseJson = _returnResponse(response);
      print(responseJson);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return response.body;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorizedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

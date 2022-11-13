import 'dart:convert';

import 'package:http/http.dart';

import 'api.dart';

class APIClient {
  final Client client;

  APIClient(this.client);
  dynamic get(String path, {Map<dynamic, dynamic>? params}) async {
    await Future.delayed(Duration(milliseconds: 500));
    final response = await client.get(
      getPath(path, params),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Uri getPath(String path, Map<dynamic, dynamic>? params) {
    var paramsString = '';
    if (params?.isNotEmpty ?? false) {
      params?.forEach((key, value) {
        paramsString += '&$key=$value';
      });
    }

    return Uri.parse(
        '${APIConstants.BASE_URL}$path?api_key=${APIConstants.API_KEY}$paramsString');
  }
}

import 'dart:convert';

import 'package:http/http.dart';

class NetworkService {
  static const String BASE = "dummyjson.com";

  static final Map<String, String> headers = {
    "Content-Type": "application/json"
  };

  //! Http apies
  static const String apiGet = "/products";

  //! HTTP response
    static Future<String> GET(String api) async {
    final uri = Uri.https(BASE, api);
    Response response = await get(uri, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    } else {
      return '\nError occurred on Status Code ${response.statusCode}\n';
    }
  }
}

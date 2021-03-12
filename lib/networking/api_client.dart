import 'dart:convert';
import 'package:frontliners/utils/AppConstant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum Method { POST, GET, PUT, DELETE, PATCH }

class ApiClient {

  static Future getFormData({
    @required String url,
  }) async {
    var uri = Uri.parse(url);

    var request = http.Request('GET', uri);

    http.StreamedResponse streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      showData(url: url, method: Method.GET, response: response.body.toString());
      return response.body;
    } else {
      errorSnackbar(msg: "internal_server_error");
      return null;
    }
  }

  static void showData({String url, var body, String response, Method method}) {
    if (!kReleaseMode) {
      print("URL = $url");
      print("Body = $body");
      print("Method = $method");
      print("Response = $response");
    }
  }
}

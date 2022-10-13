import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


class NetworkHelper {
  static Uri setApi(String endPoint) {
    return Uri.parse("https://free.currconv.com/api/v7/${endPoint}apiKey=96d71b623215eb37750e");
  }

  static String url = "https://hagez.demo.f4h.com.sa/";


  static Future<Map<String, dynamic>> repo(String endPoint, String type,
      {Map<String, dynamic>? formData, bool headerState = true}) async {

    if (kDebugMode) {
      print(setApi(endPoint));
    }
    Map<String, String> headers = {
      "Accept": "application/json",
    };
    http.Response response = type == "post"
        ? await http.post(setApi(endPoint),
        headers: headerState ? headers : null, body: formData)
        : await http.get(
        setApi(endPoint), headers: headerState ? headers : null);
    if (kDebugMode) {
      print(response.body);
    }
      Map<String, dynamic> mapResponse = jsonDecode(response.body);
      return mapResponse;
  }
}
import 'package:flutter/cupertino.dart';
import 'package:ludo/utils/constant_urls.dart';
import 'package:http/http.dart' as http;

class BaseService {
  final int _apiTimeOut = 20;

  @protected
  Future<dynamic> getDataFromServerWithUrl(String url) async {
    var apiUrl = baseApiUrl + url;
    debugPrint("api url: $apiUrl");
    var response = await http.Client()
        .get(Uri.parse(apiUrl))
        .timeout(Duration(seconds: _apiTimeOut));
    if (response.statusCode == 200) {
      debugPrint("response here: ${response.body}");
      return response.body;
    } else {
      debugPrint("error in response");
      //show error message
      return null;
    }
  }

  @protected
  Future<dynamic> getDataFromServerWithUrlAndHeader(
      String url, Map<String, String> headers) async {
    var apiUrl = baseApiUrl + url;
    debugPrint("api url: $apiUrl");
    debugPrint("headers: $headers");
    var response = await http
        .get(Uri.parse(apiUrl), headers: headers)
        .timeout(Duration(seconds: _apiTimeOut));
    debugPrint("response status code is ${response.statusCode}");
    debugPrint("response here: ${response.body}");
    try {
      if (response.statusCode == 200) {
        debugPrint("response here: ${response.body}");
        return response.body;
      } else {
        debugPrint("error in response");
        //show error message
        return null;
      }
    }catch(e){
      debugPrint("exception in response $e");
    }
  }

  @protected
  Future<dynamic> getDataFromServerWithBody(
      String url, Map<String, dynamic>? map) async {
    var apiUrl = baseApiUrl + url;
    debugPrint("api url: $apiUrl");
    debugPrint("map data: $map");
    var response = await http
        .post(Uri.parse(apiUrl), body: map)
        .timeout(Duration(seconds: _apiTimeOut));
    if (response.statusCode == 200) {
      debugPrint("response here: ${response.body}");
      return response.body;
    } else {
      debugPrint("error in response");
      //show error message
      return null;
    }
  }

  @protected
  Future<dynamic> getDataFromServerWithBodyAndHeader(String url,
      Map<String, dynamic>? map, Map<String, String>? headers) async {
    var apiUrl = baseApiUrl + url;
    debugPrint("api url: $apiUrl");
    debugPrint("headers: $headers");
    debugPrint("map data: $map");
    var response = await http
        .post(Uri.parse(apiUrl), body: map, headers: headers)
        .timeout(Duration(seconds: _apiTimeOut));
    if (response.statusCode == 200) {
      debugPrint("response here: ${response.body}");
      return response.body;
    } else {
      debugPrint("error in response");
      //show error message
      return null;
    }
  }
}

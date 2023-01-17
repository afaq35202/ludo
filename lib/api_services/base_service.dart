import 'package:flutter/cupertino.dart';
import 'package:ludo/utils/constant_urls.dart';
import 'package:http/http.dart' as http;

class BaseService {

  @protected
  Future<dynamic> getDataFromServer(String url)async{
    var apiUrl = baseApiUrl+url;
    print("api url: $apiUrl");
    var response = await http.Client().get(Uri.parse(
        apiUrl));
    if (response.statusCode == 200) {
      print("response here ${response.body}");
      return response.body;
    } else {
      print("error in response");
      //show error message
      return null;
    }
  }
}

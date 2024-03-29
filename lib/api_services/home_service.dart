import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:ludo/api_services/base_service.dart';

import '../data_models/responses/games_response.dart';

class HomeService extends BaseService {
  Future<GamesResponse?> getGames(String url,Map<String,String> headers) async {
    try {
      final response = await getDataFromServerWithUrlAndHeader(url,headers);
      debugPrint("response in home service $response");
      return GamesResponse.fromJson(jsonDecode(response));
    } catch (e) {
      debugPrint("EXCEPTION IN GET GAMES ${e.toString()}");
      return null;
    }
  }
}

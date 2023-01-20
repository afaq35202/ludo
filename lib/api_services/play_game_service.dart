import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:ludo/api_services/base_service.dart';

import '../data_models/responses/play_game_response.dart';

class PlayGameService extends BaseService{
  Future<PlayGameResponse?> getPlayers(String url,Map<String, dynamic>? map,Map<String,String> headers) async {
    try {
      final response = await getDataFromServerWithBodyAndHeader(url,map,headers);
      debugPrint("response in play game service $response");
      return PlayGameResponse.fromJson(jsonDecode(response));
    } catch (e) {
      debugPrint("EXCEPTION IN GET play game ${e.toString()}");
      return null;
    }
  }
}
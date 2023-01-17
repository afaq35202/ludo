import 'dart:convert';

import 'package:ludo/api_services/base_service.dart';

import '../data_models/responses/play_game_response.dart';

class PlayGameService extends BaseService{
  Future<PlayGameResponse?> getPlayers(String url) async {
    try {
      final response = await getDataFromServer(url);
      print("response in play game service $response");
      return PlayGameResponse.fromJson(jsonDecode(response));
    } catch (e) {
      print("EXCEPTION IN GET play game ${e.toString()}");
      return null;
    }
  }
}
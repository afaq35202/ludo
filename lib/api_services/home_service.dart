import 'dart:convert';
import 'dart:io';

import 'package:ludo/api_services/base_service.dart';

import '../data_models/games_response.dart';

class HomeService extends BaseService {
  Future<GamesResponse?> getGames(String url) async {
    try {
      final response = await getDataFromServer(url);
      print("response in home service $response");
      return GamesResponse.fromJson(jsonDecode(response));
    } catch (e) {
      print("EXCEPTION IN GET GAMES ${e.toString()}");
      return null;
    }
  }
}

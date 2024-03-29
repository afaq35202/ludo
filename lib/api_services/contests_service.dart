import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:ludo/api_services/base_service.dart';

import '../data_models/responses/game_contests_response.dart';

class ContestsService extends BaseService {
  Future<GameContestsResponse?> getContests(
      String url, Map<String, String> headers) async {
    try {
      final response = await getDataFromServerWithUrlAndHeader(url, headers);
      debugPrint("response in contests service $response");
      return GameContestsResponse.fromJson(jsonDecode(response));
    } catch (e) {
      debugPrint("EXCEPTION IN GET contests ${e.toString()}");
      return null;
    }
  }
}

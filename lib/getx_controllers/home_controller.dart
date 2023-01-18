import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ludo/api_services/home_service.dart';


import '../data_models/responses/games_response.dart';
import '../utils/constant_urls.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var gamesResponse = GamesResponse().obs;
  var checkResponse = true.obs;

  @override
  void onInit() {
    fetchGames(gameApiUrl);
    super.onInit();
  }

  void fetchGames(String url) async {
    try {
      isLoading(true);
      var response = await HomeService().getGames(url);
      if (response != null) {
        debugPrint("response in controller ${response.toJson()}");
        checkResponse(true);
        gamesResponse.value = response;
      }else{
        checkResponse(false);
      }
    } catch (e) {
      debugPrint("exception in home controller $e");
    } finally {
      isLoading(false);
    }
  }
}

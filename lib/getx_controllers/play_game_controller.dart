import 'package:get/get.dart';
import 'package:ludo/api_services/home_service.dart';


import '../api_services/play_game_service.dart';
import '../data_models/responses/games_response.dart';
import '../data_models/responses/play_game_response.dart';
import '../utils/constant_urls.dart';

class PlayGameController extends GetxController {
  var isLoading = true.obs;
  var playGameResponse = PlayGameResponse().obs;

  @override
  void onInit() {
    getPlayers(getPlayersApi);
    super.onInit();
  }

  void getPlayers(String url) async {
    try {
      isLoading(true);
      var response = await PlayGameService().getPlayers(url);
      if (response != null) {
        print("response in play game controller ${response.toJson()}");
        playGameResponse.value = response;
      }
    } catch (e) {
      print("exception in play game controller $e");
    } finally {
      isLoading(false);
    }
  }
}

import 'package:get/get.dart';
import 'package:ludo/api_services/home_service.dart';

import '../data_models/games_response.dart';
import '../utils/constant_urls.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var gamesResponse = GamesResponse().obs;

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
        print("response in controller ${response.data}");
        gamesResponse.value = response;
      }
    } catch (e) {
      print("exception in home controller $e");
    } finally {
      isLoading(false);
    }
  }
}

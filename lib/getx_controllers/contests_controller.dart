import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ludo/api_services/contests_service.dart';

import '../data_models/responses/game_contests_response.dart';
import '../utils/common.dart';
import '../utils/constant_urls.dart';

class ContestsController extends GetxController{
  var isLoading = true.obs;
  var checkResponse = true.obs;
  late String gameId;
  var gameContestsResponse = GameContestsResponse().obs;
  ContestsController(this.gameId);

  @override
  void onInit() {
    fetchGameContests(gameContestsApi);
    super.onInit();
  }
  void fetchGameContests(String url)async{
    try {
      isLoading(true);
      var response = await ContestsService().getContests(url+gameId,Common.getHeaders());
      if (response != null) {
        checkResponse(true);
        debugPrint("response in contest controller ${response.toJson()}");
        gameContestsResponse.value = response;
      }else{
        checkResponse(false);
      }
    } catch (e) {
      debugPrint("exception in contest controller $e");
    } finally {
      isLoading(false);
    }
  }
}
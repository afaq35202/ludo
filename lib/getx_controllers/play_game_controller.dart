import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ludo/data_models/models/play_game_model.dart';


import '../api_services/play_game_service.dart';
import '../data_models/responses/play_game_response.dart';
import '../utils/common.dart';
import '../utils/constant_urls.dart';

class PlayGameController extends GetxController {
  var isLoading = true.obs;
  var playScreenViewAfterSearch = false.obs;
  var playScreenViewAfterWin = false.obs;
  var playGameResponse = PlayGameResponse().obs;
  late PlayGameModel model;
  Timer? _timer;
  int remainSeconds = 1;
  final time = '70'.obs;

  PlayGameController(this.model);

  @override
  void onInit() {
    getPlayers(getPlayersApi);
    super.onInit();
  }
  @override
  void onClose(){
    if(_timer!=null){
      _timer!.cancel();
    }
    super.onClose();
  }
  startTimer(int seconds){
    const duration = Duration(seconds: 1);
    remainSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if(remainSeconds==0){
        timer.cancel();
      }else{
        time.value = remainSeconds.toString().padLeft(2, "0");
        remainSeconds--;
      }
    });
  }
  void getPlayers(String url) async {
    try {
      isLoading(true);
      var response = await PlayGameService().getPlayers(url,model.toJson(),Common.getHeaders());
      if (response != null) {
        debugPrint('response in play game controller ${response.toJson()}');
        playGameResponse.value = response;
      }
    } catch (e) {
      debugPrint("exception in play game controller $e");
    } finally {
      isLoading(false);
    }
  }
}

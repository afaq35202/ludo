// To parse this JSON data, do
//
//     final playGameModel = playGameModelFromJson(jsonString);

import 'dart:convert';

PlayGameModel? playGameModelFromJson(String str) => PlayGameModel.fromJson(json.decode(str));

String playGameModelToJson(PlayGameModel? data) => json.encode(data!.toJson());

class PlayGameModel {
  PlayGameModel({
    this.gameId,
    this.gameCategoryId,
    this.gameStatus,
  });

  String? gameId;
  String? gameCategoryId;
  String? gameStatus;

  factory PlayGameModel.fromJson(Map<String, dynamic> json) => PlayGameModel(
    gameId: json["game_id"],
    gameCategoryId: json["game_category_id"],
    gameStatus: json["game_status"],
  );

  Map<String, dynamic> toJson() => {
    "game_id": gameId,
    "game_category_id": gameCategoryId,
    "game_status": gameStatus,
  };
}

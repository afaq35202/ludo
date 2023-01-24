// To parse this JSON data, do
//
//     final gameWonModel = gameWonModelFromJson(jsonString);

import 'dart:convert';

GameWonModel gameWonModelFromJson(String str) => GameWonModel.fromJson(json.decode(str));

String gameWonModelToJson(GameWonModel data) => json.encode(data.toJson());

class GameWonModel {
  GameWonModel({
    this.gameId,
    this.gameCategpryId,
    this.testUserId,
  });

  String? gameId;
  String? gameCategpryId;
  List<int>? testUserId;

  factory GameWonModel.fromJson(Map<String, dynamic> json) => GameWonModel(
    gameId: json["game_id"],
    gameCategpryId: json["game_categpry_id"],
    testUserId: json["test_user_id"] == null ? [] : List<int>.from(json["test_user_id"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "game_id": gameId,
    "game_categpry_id": gameCategpryId,
    "test_user_id": testUserId == null ? [] : List<int>.from(testUserId!.map((x) => x)),
  };
}

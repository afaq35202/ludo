// To parse this JSON data, do
//
//     final gameContestsResponse = gameContestsResponseFromJson(jsonString);

import 'dart:convert';

GameContestsResponse? gameContestsResponseFromJson(String str) => GameContestsResponse.fromJson(json.decode(str));

String gameContestsResponseToJson(GameContestsResponse? data) => json.encode(data!.toJson());

class GameContestsResponse {
  GameContestsResponse({
    this.message,
    this.data,
  });

  String? message;
  List<Datum?>? data;

  factory GameContestsResponse.fromJson(Map<String, dynamic> json) => GameContestsResponse(
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum?>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.entryFees,
    this.prize,
    this.adminFees,
    this.gameId,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? entryFees;
  String? prize;
  String? adminFees;
  String? gameId;
  dynamic createdAt;
  dynamic updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    entryFees: json["entry_fees"],
    prize: json["prize"],
    adminFees: json["admin_fees"],
    gameId: json["game_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "entry_fees": entryFees,
    "prize": prize,
    "admin_fees": adminFees,
    "game_id": gameId,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

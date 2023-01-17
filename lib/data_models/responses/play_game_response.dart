// To parse this JSON data, do
//
//     final playGameResponse = playGameResponseFromJson(jsonString);

import 'dart:convert';

PlayGameResponse? playGameResponseFromJson(String str) => PlayGameResponse.fromJson(json.decode(str));

String playGameResponseToJson(PlayGameResponse? data) => json.encode(data!.toJson());

class PlayGameResponse {
  PlayGameResponse({
    this.message,
    this.data,
  });

  String? message;
  List<dynamic>? data;

  factory PlayGameResponse.fromJson(Map<String, dynamic> json) => PlayGameResponse(
    message: json["message"],
    data: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
  };
}

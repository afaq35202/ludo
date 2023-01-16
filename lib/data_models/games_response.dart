// To parse this JSON data, do
//
//     final gamesResponse = gamesResponseFromJson(jsonString);

import 'dart:convert';

GamesResponse? gamesResponseFromJson(String str) => GamesResponse.fromJson(json.decode(str));

String gamesResponseToJson(GamesResponse? data) => json.encode(data!.toJson());

class GamesResponse {
  GamesResponse({
    this.message,
    this.data,
  });

  String? message;
  List<Datum?>? data;

  factory GamesResponse.fromJson(Map<String, dynamic> json) => GamesResponse(
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum?>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data == null ? [] : data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  dynamic image;
  dynamic createdAt;
  dynamic updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

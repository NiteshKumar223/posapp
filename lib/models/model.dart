// To parse this JSON data, do
//
//     final welcomenk = welcomenkFromJson(jsonString);

import 'dart:convert';

List<Welcomenk> welcomenkFromJson(String str) => List<Welcomenk>.from(json.decode(str).map((x) => Welcomenk.fromJson(x)));

String welcomenkToJson(List<Welcomenk> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcomenk {
    Welcomenk({
        required this.albumId,
        required this.id,
        required this.title,
        required this.url,
        required this.thumbnailUrl,
    });

    int albumId;
    int id;
    String title;
    String url;
    String thumbnailUrl;

    factory Welcomenk.fromJson(Map<String, dynamic> json) => Welcomenk(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
    );

    Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
    };

  static void add(Welcomenk welcomenk) {}
}

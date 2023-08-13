import 'dart:convert';

SeeAllSearch seeAllSearchFromJson(String str) =>
    SeeAllSearch.fromJson(json.decode(str));

String seeAllSearchToJson(SeeAllSearch data) => json.encode(data.toJson());

class SeeAllSearch {
  String timing;
  String title;
  String color;

  SeeAllSearch({
    required this.timing,
    required this.title,
    required this.color,
  });

  factory SeeAllSearch.fromJson(Map<String, dynamic> json) => SeeAllSearch(
        timing: json["timing"],
        title: json["title"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "timing": timing,
        "title": title,
        "color": color,
      };
}

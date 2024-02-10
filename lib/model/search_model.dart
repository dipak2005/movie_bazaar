// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  List<Search>? search;
  String? totalResults;
  String? response;

  SearchModel({
    this.search,
    this.totalResults,
    this.response,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    search: json["Search"] == null ? [] : List<Search>.from(json["Search"]!.map((x) => Search.fromJson(x))),
    totalResults: json["totalResults"],
    response: json["Response"],
  );

  Map<String, dynamic> toJson() => {
    "Search": search == null ? [] : List<dynamic>.from(search!.map((x) => x.toJson())),
    "totalResults": totalResults,
    "Response": response,
  };
}

class Search {
  String? title;
  String? year;
  String? imdbId;
  Type? type;
  String? poster;

  Search({
    this.title,
    this.year,
    this.imdbId,
    this.type,
    this.poster,
  });

  factory Search.fromJson(Map<String, dynamic> json) => Search(
    title: json["Title"],
    year: json["Year"],
    imdbId: json["imdbID"],
    type: typeValues.map[json["Type"]]!,
    poster: json["Poster"],
  );

  Map<String, dynamic> toJson() => {
    "Title": title,
    "Year": year,
    "imdbID": imdbId,
    "Type": typeValues.reverse[type],
    "Poster": poster,
  };
}

enum Type {
  MOVIE,
  SERIES
}

final typeValues = EnumValues({
  "movie": Type.MOVIE,
  "series": Type.SERIES
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

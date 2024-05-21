import 'dart:convert';

import 'package:debrain_tmdb/models/movie_model.dart';

class Movies {
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  Movies({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory Movies.fromRawJson(String str) => Movies.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Movies.fromJson(Map<String, dynamic> json) => Movies(
        page: json["page"],
        results:
            List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}
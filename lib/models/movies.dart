class Movies {
  int? page;
  List<Results>? results;
  bool? success;
  String? message;

  Movies.fromJson(Map<String, dynamic> json) {
    page = json["page"];
    success = json["success"];
    message = json["status_message"];
    if (json["results"] != null) {
      results = [];
      json["results"].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
  }
}

class Results {
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  String? voteAverage;
  String? original_title;

  Results.fromJson(Map<String, dynamic> json) {
    backdropPath = json["backdrop_path"];
    genreIds = json["genre_ids"] != null ? json["genre_ids"].cast<int>() : [];
    id = json["id"];
    overview = json["overview"];
    posterPath = json["poster_path"];
    releaseDate = json["release_date"];
    title = json["title"];
    video = json["video"];
    voteAverage = json["vote_average"].toString();
    original_title = json["original_title"].toString();
  }

  Map<String, dynamic> toJson() {
    return {
      "poster_path": posterPath,
      "overview": overview,
      "id": id,
      "title": title,
      "release_date": releaseDate,
      "original_title": original_title,
      "video": video,
      "genre_ids": genreIds,
      "backdrop_path": backdropPath
    };
  }
}
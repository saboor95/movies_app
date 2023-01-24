class ReleaseModel {
  List<Genres>? genres;

  ReleaseModel({this.genres});

  ReleaseModel.fromJson(dynamic json) {
    if (json["genres"] != null) {
      genres = [];
      json["genres"].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
  }
}

class Genres {
  int? id;
  String? name;

  Genres({this.id, this.name});

  Genres.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
  }
}
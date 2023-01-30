class ReleaseModel {
  List<Genres>? genres;
  String? status_message;
  bool? success;

  ReleaseModel({this.genres, this.status_message});

  ReleaseModel.fromJson(dynamic json) {
    if (json["genres"] != null) {
      genres = [];
      json["genres"].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
    status_message = json["status_message"];
    success = json["success"];
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
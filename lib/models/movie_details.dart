/// adult : false
/// backdrop_path : "/dlrWhn0G3AtxYUx2D9P2bmzcsvF.jpg"
/// belongs_to_collection : {"id":1071588,"name":"M3GAN Collection","poster_path":"/fS57wFKda3h5dtWS3sc9JffE05R.jpg","backdrop_path":"/uXEJwb8y67vFLaJb4wvHbSH6PjT.jpg"}
/// budget : 12000000
/// genres : [{"id":878,"name":"Science Fiction"},{"id":27,"name":"Horror"},{"id":35,"name":"Comedy"}]
/// homepage : "https://www.m3ganmovie.com"
/// id : 536554
/// imdb_id : "tt8760708"
/// original_language : "en"
/// original_title : "M3GAN"
/// overview : "A brilliant toy company roboticist uses artificial intelligence to develop M3GAN, a life-like doll programmed to emotionally bond with her newly orphaned niece. But when the doll's programming works too well, she becomes overprotective of her new friend with terrifying results."
/// popularity : 5792.786
/// poster_path : "/d9nBoowhjiiYc4FBNtQkPY7c11H.jpg"
/// production_companies : [{"id":33,"logo_path":"/8lvHyhjr8oUKOOy2dKXoALWKdp0.png","name":"Universal Pictures","origin_country":"US"},{"id":3172,"logo_path":"/kDedjRZwO8uyFhuHamomOhN6fzG.png","name":"Blumhouse Productions","origin_country":"US"},{"id":76907,"logo_path":"/hGW1a2skOGoCjK9i7jmLMJjxI7B.png","name":"Atomic Monster","origin_country":"US"},{"id":89115,"logo_path":"/zQwTHJVIruUlGsa7zIdfXuSm9GG.png","name":"Divide / Conquer","origin_country":"US"}]
/// production_countries : [{"iso_3166_1":"US","name":"United States of America"}]
/// release_date : "2022-12-28"
/// revenue : 125398010
/// runtime : 102
/// spoken_languages : [{"english_name":"English","iso_639_1":"en","name":"English"}]
/// status : "Released"
/// tagline : "Friendship has evolved."
/// title : "M3GAN"
/// video : false
/// vote_average : 7.541
/// vote_count : 859

class MovieDetails {
  MovieDetails({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,});

  MovieDetails.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection =
    json['belongs_to_collection'] != null ? BelongsToCollection.fromJson(
        json['belongs_to_collection']) : null;
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      productionCompanies = [];
      json['production_companies'].forEach((v) {
        productionCompanies?.add(ProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = [];
      json['production_countries'].forEach((v) {
        productionCountries?.add(ProductionCountries.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      spokenLanguages = [];
      json['spoken_languages'].forEach((v) {
        spokenLanguages?.add(SpokenLanguages.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  bool? adult;
  String? backdropPath;
  BelongsToCollection? belongsToCollection;
  num? budget;
  List<Genres>? genres;
  String? homepage;
  num? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;
  String? posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  String? releaseDate;
  num? revenue;
  num? runtime;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  num? voteAverage;
  num? voteCount;
}

/// english_name : "English"
/// iso_639_1 : "en"
/// name : "English"

class SpokenLanguages {
  SpokenLanguages({
    this.englishName,
    this.iso6391,
    this.name,});

  SpokenLanguages.fromJson(dynamic json) {
    englishName = json['english_name'];
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }

  String? englishName;
  String? iso6391;
  String? name;

}

/// iso_3166_1 : "US"
/// name : "United States of America"

class ProductionCountries {
  ProductionCountries({
    this.iso31661,
    this.name,});

  ProductionCountries.fromJson(dynamic json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }

  String? iso31661;
  String? name;

}

/// id : 33
/// logo_path : "/8lvHyhjr8oUKOOy2dKXoALWKdp0.png"
/// name : "Universal Pictures"
/// origin_country : "US"

class ProductionCompanies {
  ProductionCompanies({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,});

  ProductionCompanies.fromJson(dynamic json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }

  num? id;
  String? logoPath;
  String? name;
  String? originCountry;

}

/// id : 878
/// name : "Science Fiction"

class Genres {
  Genres({
    this.id,
    this.name,});

  Genres.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  num? id;
  String? name;

}

/// id : 1071588
/// name : "M3GAN Collection"
/// poster_path : "/fS57wFKda3h5dtWS3sc9JffE05R.jpg"
/// backdrop_path : "/uXEJwb8y67vFLaJb4wvHbSH6PjT.jpg"

class BelongsToCollection {
  BelongsToCollection({
    this.id,
    this.name,
    this.posterPath,
    this.backdropPath,});

  BelongsToCollection.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
  }

  num? id;
  String? name;
  String? posterPath;
  String? backdropPath;

}
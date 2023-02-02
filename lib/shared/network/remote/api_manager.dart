import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../models/movie_details.dart';
import '../../../models/movies.dart';
import '../../../models/release.dart';
import '../../constants/constants.dart';
class ApiManager {

  static Future<Movies> getPopular() async {
    final response = await http.get(
      Uri.parse(
          'https://$BASE/3/movie/popular?api_key=$APIKEY&adult=false&language=en-US&page=1'),
    );
    var popularResponse = Movies.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return popularResponse;
    } else {
      throw Exception('Failed to load the popular');
    }
  }

  static Future<Movies> getTopRated() async {
    var response = await http.get(
      Uri.parse(
          'https://$BASE/3/movie/top_rated?api_key=$APIKEY&adult=false&language=en-US&page=1'),
    );
    var movieResponse = Movies.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return movieResponse;
    } else {
      throw Exception('Failed to load the top rated');
    }
  }


  static Future<Movies> getSimilar(int movieId) async {
    var header = '/3/movie/$movieId/similar';
    Uri url = Uri.https(
      BASE,
      header,
      {
        'api_key': APIKEY,
      },
    );
    final response = await http.get(
      url,
      headers: {
        'movie_id': '',
      },
    );
    var similarResponse = Movies.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return similarResponse;
    } else {
      throw Exception('Failed to load album');
    }
  }


  static Future<Movies> getSearchingAbout(String query) async {
    var response = await http.get(
      Uri.parse(
          'https://$BASE/3/search/movie?api_key=$APIKEY&adult=false&query=$query'),
    );
    var movieResponse = Movies.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return movieResponse;
    } else {
      throw Exception('Failed to load album');
    }
  }


  static Future<MovieDetails> getMovieDetails(int movieId) async {
    var response = await http.get(
      Uri.parse('https://$BASE/3/movie/$movieId?api_key=$APIKEY&adult=false&'),
    );
    var movieResponse = MovieDetails.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return movieResponse;
    } else {
      throw Exception('Failed to load album');
    }
  }


  static Future<ReleaseModel> getCategory() async {
    final response = await http.get(
      Uri.parse(
          'https://$BASE/3/genre/movie/list?api_key=$APIKEY&adult=false&language=en-US'),
    );
    var releaseResponse = ReleaseModel.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return releaseResponse;
    } else {
      throw Exception('Failed to load the category');
    }
  }


  static Future<Movies> getMoviesByList(int genreId) async {
    var response = await http.get(
      Uri.parse(
          "https://$BASE/3/discover/movie?api_key=$APIKEY&adult=false&language=en-US&with_genres=$genreId"),
    );
    var movieResponse = Movies.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return movieResponse;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
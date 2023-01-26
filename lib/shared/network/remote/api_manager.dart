import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import '../../../models/movies.dart';
import '../../../models/release.dart';
import '../../constants/constants.dart';
class ApiManager {

  static Future<Movies> getPopular() async {
    final response = await http.get(
      Uri.parse(
          'https://$BASE/3/movie/popular?api_key=$APIKEY&language=en-US&page=1'),
    );
    var popularResponse = Movies.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return popularResponse;
    } else {
      throw e;
    }
  }
  static Future<ReleaseModel> getNewRelease() async {
    final response = await http.get(
      Uri.parse(
          'https://$BASE/3/genre/movie/list?api_key=$APIKEY&language=en-US'),
    );
    var releaseResponse = ReleaseModel.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return releaseResponse;
    } else {
      throw e;
    }
  }
  static Future<Movies> getTopRated() async {
    var response = await http.get(
      Uri.parse(
          'https://$BASE/3/movie/top_rated?api_key=$APIKEY&language=en-US&page=1'),
    );
    var movieResponse = Movies.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return movieResponse;
    } else {
      throw Exception('Failed to load album');
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
      throw e;
    }
  }

  static Future<Movies> getSearchingAbout(String query) async {
    var response = await http.get(
      Uri.parse('https://$BASE/3/search/movie?api_key=$APIKEY&query=$query'),
    );
    var movieResponse = Movies.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return movieResponse;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
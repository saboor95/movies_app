import 'package:flutter/cupertino.dart';
import 'package:movies_app/shared/network/local/firebase_utils.dart';
import '../models/movies.dart';

class MyProvider extends ChangeNotifier {

  void selectMovie(Results resultsMovie) {
    DatabaseUtils.addMovieToFirebase(resultsMovie);
    notifyListeners();
  }

  void unSelectMovie(Results resultsMovie) {
    DatabaseUtils.deleteMovieFromFirebase(resultsMovie.id!);
    notifyListeners();
  }
}
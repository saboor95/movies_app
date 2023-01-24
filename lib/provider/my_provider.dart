import 'package:flutter/cupertino.dart';
import '../models/movies.dart';

class MyProvider extends ChangeNotifier {
  List<Results> watchList = [];
  List<int> idList = [];
  Map<int, Results> list = {};

  void selectMovie(Results resultsMovie) {
    if (!idList.contains(resultsMovie.id)) {
      watchList.add(resultsMovie);
      idList.add(resultsMovie.id!);
      print('${idList}');
      print('${watchList}');
    } else if (idList.contains(resultsMovie.id)) {
      idList.remove(resultsMovie.id);
      watchList.removeWhere((element) => element.id == resultsMovie.id);
      print('${idList}');
      print('${watchList}');
      print('unselect item');
    }
    notifyListeners();
  }
}
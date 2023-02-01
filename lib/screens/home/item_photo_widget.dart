import 'package:flutter/material.dart';
import 'package:movies_app/screens/home/bookmark_widget.dart';
import 'package:movies_app/shared/network/local/firebase_utils.dart';
import '../../models/movies.dart';
import 'movie_details/details_screen.dart';

class ItemPhotoWidget extends StatelessWidget {
  Movies? movies;
  int index;

  ItemPhotoWidget(this.movies, this.index);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => DetailsScreen(
                    movies!.results!.elementAt(index),
                    index: index),
              ),
            );
          },
          child: movies!.results!.elementAt(index).posterPath == null
              ? Container(
                  height: MediaQuery.of(context).size.width * 0.3,
                  width: MediaQuery.of(context).size.height * 0.22,
                  child: Center(
                    child: Icon(
                      Icons.error_outline,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                )
              : Image.network(
                  'https://image.tmdb.org/t/p/w500'
                  '${movies!.results!.elementAt(index).posterPath}',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.22,
                ),
        ),
        StreamBuilder(
          stream: DatabaseUtils.getMovieFromFirebase(),
          builder: (context, snapshot) {
            late bool isSelected;
            var moviesResult =
                snapshot.data?.docs.map((doc) => doc.data()).toList() ?? [];
            if (moviesResult.isEmpty) {
              return BookmarkWidget(movies!.results!.elementAt(index), false);
            }
            for (int x = 0; x < moviesResult.length; x++) {
              if (moviesResult.elementAt(x).id ==
                  movies!.results!.elementAt(index).id) {
                isSelected = true;
                break;
              } else {
                isSelected = false;
              }
            }
            return BookmarkWidget(
                movies!.results!.elementAt(index), isSelected);
          },
        ),
      ],
    );
  }
}

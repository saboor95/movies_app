import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/movies.dart';
import '../../provider/my_provider.dart';
import '../../shared/network/local/firebase_utils.dart';
import '../../shared/styles/colors.dart';
import '../home/bookmark_widget.dart';
import '../home/movie_details/details_screen.dart';

class WatchListItem extends StatelessWidget {
  List<Results>? movieResult;
  int index;

  WatchListItem(this.movieResult, this.index);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      height: 95,
      child: Row(
        children: [
          Stack(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => DetailsScreen(
                          movieResult!.elementAt(index),
                          index: index),
                    ),
                  );
                },
                child: ClipRRect(
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500'
                    '${movieResult!.elementAt(index).posterPath}',
                    fit: BoxFit.cover,
                    width: 150,
                    height: 100,
                  ),
                ),
              ),
              StreamBuilder(
                stream: DatabaseUtils.getMovieFromFirebase(),
                builder: (context, snapshot) {
                  late bool isSelected;
                  var moviesResult =
                      snapshot.data?.docs.map((doc) => doc.data()).toList() ??
                          [];
                  if (moviesResult.isEmpty) {
                    return BookmarkWidget(movieResult!.elementAt(index), false);
                  }
                  for (int x = 0; x < moviesResult.length; x++) {
                    if (moviesResult.elementAt(x).id ==
                        movieResult!.elementAt(index).id) {
                      isSelected = true;
                      break;
                    } else {
                      isSelected = false;
                    }
                  }
                  return BookmarkWidget(
                      movieResult!.elementAt(index), isSelected);
                },
              ),
            ],
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  movieResult!.elementAt(index).title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  movieResult!.elementAt(index).releaseDate ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    color: COLORGREY,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  movieResult!.elementAt(index).overview ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    color: COLORGREY,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

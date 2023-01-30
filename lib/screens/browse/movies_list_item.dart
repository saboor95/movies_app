import 'package:flutter/material.dart';
import 'package:movies_app/models/movies.dart';
import 'package:movies_app/provider/my_provider.dart';
import 'package:provider/provider.dart';

import '../../shared/styles/colors.dart';
import '../home/movie_details/details_screen.dart';

class MoviesListItem extends StatelessWidget {
  static const String routeName = 'movies list';
  Results moviesResult;

  MoviesListItem(this.moviesResult);

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
                      builder: (BuildContext context) =>
                          DetailsScreen(moviesResult),
                    ),
                  );
                },
                child: moviesResult.backdropPath == null
                    ? Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .width * 0.3,
                  width: MediaQuery
                      .of(context)
                      .size
                      .height * 0.22,
                  child: Icon(
                    Icons.error_outline,
                    size: 35,
                    color: Colors.white,
                  ),
                )
                    : ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500'
                        '${moviesResult.backdropPath}',
                    fit: BoxFit.cover,
                    width: 150,
                    height: 100,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  provider.selectMovie(moviesResult);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: provider.idList.contains(moviesResult.id)
                      ? Image.asset('assets/images/check.png')
                      : Image.asset('assets/images/bookmark.png'),
                ),
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
                  moviesResult.title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  moviesResult.releaseDate ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    color: COLORGREY,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  moviesResult.overview ?? '',
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

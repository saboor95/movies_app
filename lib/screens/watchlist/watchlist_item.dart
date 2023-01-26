import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/movies.dart';
import '../../provider/my_provider.dart';
import '../../shared/styles/colors.dart';
import '../home/movie_details/details_screen.dart';

class WatchListItem extends StatelessWidget {
  Results? movieResult;

  WatchListItem(this.movieResult);

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
                          DetailsScreen(movieResult!),
                    ),
                  );
                },
                child: ClipRRect(
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500'
                        '${movieResult!.posterPath}',
                    fit: BoxFit.cover,
                    width: 150,
                    height: 100,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  provider.selectMovie(movieResult!);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: provider.idList.contains(movieResult!.id)
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
                  movieResult!.title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  movieResult!.releaseDate ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    color: COLORGREY,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  movieResult!.overview ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    color:COLORGREY,
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
import 'package:flutter/material.dart';
import '../../../models/movies.dart';
import '../../home/movie_details/details_screen.dart';

class SearchingItemPhoto extends StatelessWidget {
  Movies? movies;
  int index;

  SearchingItemPhoto(this.movies, this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Column(
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
            child: movies!.results!.elementAt(index).backdropPath == null
                ? Container(
                    height: MediaQuery.of(context).size.width * 0.3,
                    width: MediaQuery.of(context).size.height * 0.22,
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
                      '${movies!.results!.elementAt(index).backdropPath}',
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.width * 0.3,
                      width: MediaQuery.of(context).size.height * 0.22,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

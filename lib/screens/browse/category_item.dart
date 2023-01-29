import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/movies.dart';
import 'package:movies_app/models/release.dart';
import 'package:movies_app/shared/network/remote/api_manager.dart';
import '../../shared/styles/colors.dart';
import 'movies_list.dart';

class CategoryItem extends StatelessWidget {
  Genres genres;

  CategoryItem(this.genres);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
            context, MoviesListScreen.routeName, arguments: genres);
      },
      child: Stack(
        children: [
          FutureBuilder<Movies>(
            future: ApiManager.getMoviesByList(genres.id!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: COLORYELLOW,
                  ),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error ?? "has error"}',
                      style: TextStyle(color: Colors.white)),
                );
              }
              return CachedNetworkImage(
                  imageUrl: "https://image.tmdb.org/t/p/w500"
                      "${snapshot.data!.results!.elementAt(4).backdropPath}",
                  imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ));
            },
          ),
          Center(
            child: Text(genres.name!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movies_app/screens/home/movie_details/more_similar/more_similar_widget.dart';
import 'package:movies_app/screens/home/movie_details/more_similar/movie_genre_name.dart';
import 'package:movies_app/shared/network/remote/api_manager.dart';
import 'package:provider/provider.dart';
import '../../../models/movies.dart';
import '../../../models/release.dart';
import '../../../provider/my_provider.dart';
import '../../../shared/styles/colors.dart';


class DetailsScreen extends StatelessWidget {
  static const String routeName = 'detailsScreen';
  Results? movieResult;

  DetailsScreen(this.movieResult);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: COLORBACKGROUND,
      appBar: AppBar(
        backgroundColor: COLORBACKGROUND,
        title: Text(movieResult!.title ?? '',
          style: TextStyle(color: Colors.white,
              fontSize: 20,fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: size.height * 0.22,
                  child: Stack(
                    children: [
                      movieResult!.backdropPath == null ?
                      Icon(Icons.error_outline,
                        size: 35,
                        color: Colors.white,
                      ) : Image.network(
                        'https://image.tmdb.org/t/p/w500'
                            '${movieResult!.backdropPath}',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      Positioned(
                        left: size.width * 0.40,
                        top: size.height * 0.06,
                        child: Icon(
                          Icons.play_circle_filled,
                          size: 80,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 10),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * .95,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        movieResult?.title ?? '',
                        style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        movieResult?.releaseDate ?? '',
                        style: TextStyle(
                          fontSize: 13,
                          color: COLORGREY,
                        ),
                      ),
                      // PopularItem(movies),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: size.width * 0.28,
                  height: size.height * 0.3,
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500'
                              '${movieResult!.posterPath}',
                          fit: BoxFit.cover,
                          width: size.width * 0.3,
                          height: size.height * 0.27,
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
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FutureBuilder(
                      future: ApiManager.getMovieDetails(movieResult!.id!),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(color: COLORGREY),
                            ),
                            child: Text(
                              'Loading ...',
                              style:
                              TextStyle(color: COLORGREY, fontSize: 13),
                            ),
                          );
                        }
                        if (snapshot.hasError) {
                          return Center(
                              child: Text(
                                '${snapshot.error}',
                                style: TextStyle(color: Colors.white),
                              ));
                        }
                        return MovieGenreName(snapshot.data!);
                      },),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * .65,
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        movieResult!.overview ?? '',
                        textWidthBasis: TextWidthBasis.parent,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: COLORYELLOW,
                          size: 25,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          movieResult!.voteAverage ?? '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            FutureBuilder<Movies>(
              future: ApiManager.getSimilar(
                movieResult?.id ?? 0,
              ),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return MoreSimilarWidget(snapshot.data);
                } else if (snapshot.hasError) {
                  return Center(
                      child: Text(
                        '${snapshot.error}',
                        style: TextStyle(color: Colors.white),
                      ));
                }
                return Center(
                  child: const CircularProgressIndicator(
                    color: Color.fromRGBO(255, 187, 59, 1.0),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

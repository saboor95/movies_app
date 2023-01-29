import 'package:flutter/material.dart';
import 'package:movies_app/models/movies.dart';
import 'package:movies_app/models/release.dart';
import 'package:movies_app/screens/browse/movies_list_item.dart';
import 'package:movies_app/shared/network/remote/api_manager.dart';
import '../../shared/styles/colors.dart';

class MoviesListScreen extends StatelessWidget {
  static const String routeName = 'movies list';

  @override
  Widget build(BuildContext context) {
    var genre = ModalRoute
        .of(context)
        ?.settings
        .arguments as Genres;
    return Scaffold(
      appBar: AppBar(
        title: Text('${genre.name}',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,
              color: Colors.white),),
        backgroundColor: COLORBACKGROUND,
        elevation: 0,
        titleSpacing: 10,
        toolbarHeight: 45,
      ),
      backgroundColor: COLORBACKGROUND,
      body: FutureBuilder<Movies>(
        future: ApiManager.getMoviesByList(genre.id!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 30),
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.white70,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              );
            },
            itemCount: snapshot.data!.results!.length,
            itemBuilder: (context, index) {
              return MoviesListItem(snapshot.data!.results![index]);
            },);
        },),
    );
  }
}

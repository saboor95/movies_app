import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/movies.dart';
import '../../provider/my_provider.dart';
import 'movie_details/details_screen.dart';

class ItemPhotoWidget extends StatelessWidget {
  Movies? movies;
  int index;

  ItemPhotoWidget(this.movies, this.index);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    DetailsScreen(movies!.results!.elementAt(index)),
              ),
            );
          },
          child: Image.network(
            'https://image.tmdb.org/t/p/w500'
                '${movies!.results!.elementAt(index).posterPath}',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width*0.3,
            height: MediaQuery.of(context).size.height*0.22,
          ),
        ),
        InkWell(
          onTap: () {
            provider.selectMovie(movies!.results!.elementAt(index));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child:
            provider.idList.contains(movies!.results!.elementAt(index).id)
                ? Image.asset('assets/images/check.png')
                : Image.asset('assets/images/bookmark.png'),
          ),
        ),
      ],
    );
  }
}
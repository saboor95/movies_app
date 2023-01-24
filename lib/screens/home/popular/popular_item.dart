import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/movies.dart';
import '../../../provider/my_provider.dart';
import '../movie_details/details_screen.dart';



class PopularItem extends StatelessWidget {
  Results? resultResponse;

  PopularItem(this.resultResponse);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      width:MediaQuery.of(context).size.width*0.28,
      height: MediaQuery.of(context).size.height*0.35,
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      DetailsScreen(resultResponse!),
                ),
              );
            },
            child: Image.network(
              'https://image.tmdb.org/t/p/w500'
                  '${resultResponse!.posterPath}',
              width: MediaQuery.of(context).size.width*0.8,
              height:  MediaQuery.of(context).size.height*0.21,
            ),
          ),
          InkWell(
            onTap: () {
              provider.selectMovie(resultResponse!);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: provider.idList.contains(resultResponse!.id)
                  ? Image.asset('assets/images/check.png')
                  : Image.asset('assets/images/bookmark.png'),
            ),
          ),
        ],
      ),
    );
  }
}
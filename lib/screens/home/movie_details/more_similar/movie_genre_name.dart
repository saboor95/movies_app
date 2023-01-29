import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_details.dart';

import '../../../../shared/styles/colors.dart';

class MovieGenreName extends StatelessWidget {
  MovieDetails movieDetails;

  MovieGenreName(this.movieDetails);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            movieDetails.genres!.isEmpty
                ? Container()
                : Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: COLORGREY),
                    ),
                    child: Text(
                      '${movieDetails.genres!.elementAt(0).name}',
                      style: TextStyle(color: COLORGREY, fontSize: 13),
                    ),
                  ),
            movieDetails.genres!.length > 1
                ? Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: COLORGREY),
                    ),
                    child: Text(
                      '${movieDetails.genres!.elementAt(1).name}',
                      style: TextStyle(color: COLORGREY, fontSize: 13),
                    ),
                  )
                : Container(),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            movieDetails.genres!.length > 2
                ? Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: COLORGREY),
                    ),
                    child: Text(
                      '${movieDetails.genres!.elementAt(2).name}',
                      style: TextStyle(color: COLORGREY, fontSize: 13),
                    ),
                  )
                : Container(),
            movieDetails.genres!.length > 3
                ? Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: COLORGREY),
                    ),
                    child: Text(
                      '${movieDetails.genres!.elementAt(3).name}',
                      style: TextStyle(color: COLORGREY, fontSize: 13),
                    ),
                  )
                : Container(),
          ],
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../../models/movies.dart';
import '../../../shared/styles/colors.dart';
import '../item_photo_widget.dart';


class TopRatedItem extends StatelessWidget {
  Movies? topMovies;
  int index;

  TopRatedItem(this.topMovies, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  MediaQuery.of(context).size.width*0.28,
      height: MediaQuery.of(context).size.height*0.20,
      margin: EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(color: COLORBLACK, blurRadius: 1.6),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ItemPhotoWidget(topMovies, index),
            ],
          ),
          Expanded(
            child: Container(
              color: COLORDARKGREY,
              child: Padding(
                padding: const EdgeInsets.only(top: 5,left: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.grade,
                          size: 18,
                          color: COLORYELLOW,
                        ),
                        SizedBox(width: 3),
                        Text(
                          '${topMovies!.results!.elementAt(index).voteAverage}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        topMovies!.results!.elementAt(index).title ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 3),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        topMovies!.results!.elementAt(index).releaseDate ?? '',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 10,
                          color: COLORGREY,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:movies_app/screens/home/movie_details/more_similar/more_similar_item.dart';

import '../../../../models/movies.dart';
import '../../../../shared/styles/colors.dart';



class MoreSimilarWidget extends StatelessWidget {
  Movies? topMovies;

  MoreSimilarWidget(this.topMovies);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      color: COLORDARK,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'More Like This',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) =>
                  MoreSimilarItem(topMovies, index),
              itemCount: topMovies?.results?.length ?? 0,
            ),
          ),
        ],
      ),
    );
  }
}
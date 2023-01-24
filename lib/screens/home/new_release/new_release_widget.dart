import 'package:flutter/material.dart';
import '../../../models/movies.dart';
import '../../../shared/styles/colors.dart';
import 'new_release_item.dart';


class NewRelaseWidget extends StatelessWidget {
  Movies? topMovies;

  NewRelaseWidget(this.topMovies);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.3,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      color: COLORDARK,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'New Releases',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
           SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) =>
                  NewRelaseItem(topMovies, index),
              itemCount: topMovies!.results!.length,
            ),
          ),
        ],
      ),
    );
  }
}

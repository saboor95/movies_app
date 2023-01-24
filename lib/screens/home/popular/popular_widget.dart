import 'package:flutter/material.dart';
import 'package:movies_app/screens/home/popular/popular_item.dart';

import '../../../models/movies.dart';
import '../../../shared/styles/colors.dart';


class Popular extends StatelessWidget {
  Results? resultResponse;

  Popular(this.resultResponse);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.5,
      margin: EdgeInsets.only(bottom: 5),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: size.height * 0.22,
            child: Stack(
              children: [
                Image.network(
                  'https://image.tmdb.org/t/p/w500'
                      '${resultResponse!.backdropPath ?? ''}',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Positioned(
                  left: size.width * 0.40,
                  top: size.height * 0.05,
                  child: Icon(
                    Icons.play_circle_filled,
                    size: 70,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: size.width * 0.07,
            top: size.height * 0.08,
            child: Row(
              children: [
                PopularItem(resultResponse),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      resultResponse!.title ?? '',
                      overflow: TextOverflow.visible,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      resultResponse!.releaseDate ?? '',
                      style: TextStyle(
                        fontSize: 13,
                        color:COLORGREY,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

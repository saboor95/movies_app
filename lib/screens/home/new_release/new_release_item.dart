import 'package:flutter/material.dart';
import '../../../models/movies.dart';
import '../item_photo_widget.dart';


class NewRelaseItem extends StatelessWidget {
  Movies? topMovies;
  int index;

  NewRelaseItem(this.topMovies, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.28,
      height: MediaQuery.of(context).size.height*0.28,
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: ItemPhotoWidget(topMovies, index),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:movies_app/models/movies.dart';
import 'package:provider/provider.dart';

import '../../provider/my_provider.dart';

class BookmarkWidget extends StatelessWidget {
  Results results;
  bool isSelected;

  BookmarkWidget(this.results, this.isSelected);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return InkWell(
      onTap: () {
        isSelected
            ? provider.unSelectMovie(results)
            : provider.selectMovie(results);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: isSelected
            ? Image.asset('assets/images/check.png')
            : Image.asset('assets/images/bookmark.png'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/movies.dart';
import '../../../provider/my_provider.dart';
import '../../../shared/network/local/firebase_utils.dart';
import '../bookmark_widget.dart';
import '../movie_details/details_screen.dart';

class PopularItem extends StatelessWidget {
  Results? resultResponse;

  PopularItem(this.resultResponse);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.28,
        height: MediaQuery.of(context).size.height * 0.35,
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
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.21,
              ),
            ),
            StreamBuilder(
              stream: DatabaseUtils.getMovieFromFirebase(),
              builder: (context, snapshot) {
                late bool isSelected;
                var moviesResult =
                    snapshot.data?.docs.map((doc) => doc.data()).toList() ?? [];
                if (moviesResult.isEmpty) {
                  return BookmarkWidget(resultResponse!, false);
                }
                for (int x = 0; x < moviesResult.length; x++) {
                  if (moviesResult.elementAt(x).id == resultResponse!.id) {
                    isSelected = true;
                    break;
                  } else {
                    isSelected = false;
                  }
                }
                return BookmarkWidget(resultResponse!, isSelected);
              },
            ),
          ],
        ),
      ),
    );
  }
}
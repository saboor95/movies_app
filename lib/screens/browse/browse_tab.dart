import 'package:flutter/material.dart';
import 'package:movies_app/screens/browse/browse_view_model.dart';
import 'package:movies_app/screens/browse/category_item.dart';
import 'package:movies_app/screens/browse/movies_list.dart';

import '../../base.dart';
import '../../models/release.dart';
import '../../shared/network/remote/api_manager.dart';
import '../../shared/styles/colors.dart';


class BrowseTab extends StatefulWidget {
  const BrowseTab({Key? key}) : super(key: key);

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends BaseView<BrowseViewModel,
    BrowseTab>
    implements BrowseNavigator {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: COLORBACKGROUND,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Browse Category',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),),
            FutureBuilder<ReleaseModel>(
                future: ApiManager.getCategory(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('${snapshot.error ?? "has error"}',
                          style: TextStyle(color: Colors.white)),
                    );
                  }
                  var movieGenres = snapshot.data?.genres ?? [];
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 30,
                          crossAxisSpacing: 30
                      ),
                      itemCount: movieGenres.length,
                      itemBuilder: (context, index) {
                        return CategoryItem(movieGenres[index]);
                      },),
                  );
                }),
          ],
        ),
      ),
    );
  }

  @override
  BrowseViewModel initViewModel() {
    return BrowseViewModel();
  }
}

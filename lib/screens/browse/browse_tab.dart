import 'package:flutter/material.dart';
import 'package:movies_app/screens/browse/browse_view_model.dart';
import 'package:movies_app/screens/browse/category_item.dart';
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
    return Scaffold(
      backgroundColor: COLORBACKGROUND,
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(top: 18),
          child: Text('Browse Category',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,
              color: Colors.white,
            ),),
        ),
        titleSpacing: 10,
        toolbarHeight:45,
        backgroundColor: COLORBACKGROUND,
        elevation: 0.0,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FutureBuilder<ReleaseModel>(
                future: ApiManager.getCategory(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: COLORYELLOW,
                      ),
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
                          crossAxisSpacing: 30,
                        childAspectRatio: 2/1
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

import 'package:flutter/material.dart';
import 'package:movies_app/base.dart';
import 'package:movies_app/models/movies.dart';
import 'package:movies_app/screens/search/search_screan_view/search_navigator.dart';
import 'package:movies_app/screens/search/search_view_model.dart';
import 'package:movies_app/screens/search/search_screan_view/searching_item.dart';
import 'package:movies_app/shared/network/remote/api_manager.dart';
import '../../../shared/styles/colors.dart';

class SearchTab extends StatefulWidget {
  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends BaseView<SearchViewModel, SearchTab>
    implements SearchNavigator {
  var textController = TextEditingController();
  String text = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: COLORBACKGROUND,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
            child: TextFormField(
              onChanged: (value) {
                text = value;
                setState(() {});
              },
              controller: textController,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              decoration: InputDecoration(
                prefixIcon: IconButton(
                    onPressed: () {
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.search_outlined,
                      color: Colors.white,
                    )),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                fillColor: COLOR_BG_SEARCH,
                filled: true,
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide: BorderSide(
                      color: Colors.white70,
                      width: .5,
                    )),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  borderSide: BorderSide(
                    color: Colors.white70,
                    width: .5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: .6,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: text == ''
                  ? Image.asset('assets/images/no_movie.png')
                  : FutureBuilder<Movies>(
                      future: ApiManager.getSearchingAbout(text),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                        var movies = snapshot.data?.results ?? [];
                        return ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          itemCount: movies.length,
                          itemBuilder: (context, index) {
                            return SearchingItem(
                                movies[index], index, snapshot.data!);
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider(
                              color: Colors.white70,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                            );
                          },
                        );
                      }))
        ],
      ),
    );
  }

  @override
  SearchViewModel initViewModel() {
    return SearchViewModel();
  }
}

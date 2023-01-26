import 'package:flutter/material.dart';
import 'package:movies_app/screens/watchlist/watchlist_item.dart';
import 'package:movies_app/shared/styles/colors.dart';
import 'package:provider/provider.dart';
import '../../models/movies.dart';
import '../../provider/my_provider.dart';

class WatchListTab extends StatefulWidget {
  @override
  State<WatchListTab> createState() => _WatchListTabState();
}

class _WatchListTabState extends State<WatchListTab> {
  Movies? movies;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Scaffold(
      backgroundColor: COLORBACKGROUND,
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(top: 25),
          child: Text('WatchList',
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
        width: double.infinity,
        margin: EdgeInsets.only(left: 15, right: 10,),
        child: Column(
          children: [
            SizedBox(height: 20),
            provider.idList.isNotEmpty
                ? Expanded(
              child: ListView.separated(
                itemBuilder: (buildContext, index) {
                  return WatchListItem(provider.watchList.elementAt(index));
                },
                separatorBuilder: (buildContext, index) =>
                    Container(
                      margin: EdgeInsets.only(
                        left: 2,
                        right: 2,
                        top: 15,
                        bottom: 18,
                      ),
                      width: double.infinity,
                      height: 1,
                      color: COLORGREY,
                    ),
                itemCount: provider.watchList.length,
              ),
            )
                : Container(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.32),
                  child: Text(
                    'No movies selected yet.',
                    style: TextStyle(
                      fontSize: 18,
                      color: COLORGREY,
                    ),
                  ),
                ) ],
              ),
            ));
  }
}
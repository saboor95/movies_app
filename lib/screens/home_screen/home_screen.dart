import 'package:flutter/material.dart';
import '../../shared/styles/colors.dart';
import '../browse/browse_tab.dart';
import '../home/home_tab.dart';
import '../search/search_tab.dart';
import '../watchlist/watchlist_tab.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName='home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:COLORBLACK,
        unselectedItemColor: COLORGREY,
       selectedItemColor: COLORYELLOW,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/Home_icon.png'),
              size: 20,
            ),
            label:  'HOME',),

          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/search_icon.png'),
              size: 20,
            ),
            label:  'SEARCH',),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/movie_icon.png'),
              size: 20,
            ),
            label:  'BROWSE',),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/Icon_ionic.png'),
              size: 20,
            ),
            label:  'WATCHLIST',),

        ],
      ),
      body: tabs[currentIndex],
    );
  }
  List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    BrowseTab(),
    WatchListTab(),
  ];
}

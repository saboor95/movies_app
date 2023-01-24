import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/screens/home/popular/popular_widget.dart';
import 'package:movies_app/screens/home/top_rated/top_rated_widget.dart';
import 'package:movies_app/shared/styles/colors.dart';
import '../../models/movies.dart';
import '../../shared/network/remote/api_manager.dart';
import 'new_release/new_release_widget.dart';



class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  CarouselController carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: COLORBACKGROUND,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FutureBuilder<Movies>(
                future: ApiManager.getPopular(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'error => ${snapshot.error}',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: const CircularProgressIndicator(
                        color: Color.fromRGBO(255, 187, 59, 1.0),
                      ),
                    );
                  }
                  return CarouselSlider(
                    items: snapshot.data!.results!.map((element) {
                      return Popular(element);
                    }).toList(),
                    options: CarouselOptions(
                      height: size.height * 0.30,
                      initialPage: 0,
                      viewportFraction: 1.0,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      reverse: false,
                      autoPlayInterval: Duration(seconds: 10),
                      autoPlayAnimationDuration: Duration(milliseconds: 400),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      scrollDirection: Axis.horizontal,
                    ),
                  );
                },
              ),
              FutureBuilder<Movies>(
                future: ApiManager.getPopular(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return NewRelaseWidget(snapshot.data);
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text(
                          '${snapshot.error}',
                          style: TextStyle(color: Colors.white),
                        ));
                  }
                  return Center(
                      child: const CircularProgressIndicator(
                        color: Color.fromRGBO(255, 187, 59, 1.0),
                      ));
                },
              ),
              FutureBuilder<Movies>(
                future: ApiManager.getTopRated(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return TopRatedWidget(snapshot.data);
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text(
                          '${snapshot.error}',
                          style: TextStyle(color: Colors.white),
                        ));
                  }
                  return Center(
                      child: const CircularProgressIndicator(
                        color: Color.fromRGBO(255, 187, 59, 1.0),
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}



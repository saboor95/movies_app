import 'package:flutter/material.dart';
import 'package:movies_app/provider/my_provider.dart';
import 'package:provider/provider.dart';
import 'layout/home_layout/home_layout.dart';



void main() {
      runApp(  ChangeNotifierProvider(
      create: (BuildContext context) => MyProvider(),
      child:  MyApp()));

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
return MaterialApp(
  initialRoute:HomeLayout.routeName,
  routes: {
    HomeLayout.routeName:(context)=>HomeLayout(),
  },
  debugShowCheckedModeBanner: false,
);
  }
}


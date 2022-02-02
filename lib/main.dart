import 'package:flutter/material.dart';
import 'package:pdp_ui9_instagram/pages/feed_page.dart';
import 'package:pdp_ui9_instagram/pages/home_page.dart';
import 'package:pdp_ui9_instagram/pages/like_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        HomePage.id: (context) =>HomePage(),
        FeedPage.id:(context)=>FeedPage(),
        LikePage.id:(context)=>LikePage(),
      },
    );
  }
}



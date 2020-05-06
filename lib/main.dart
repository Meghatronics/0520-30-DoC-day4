import 'package:day4_30doc/pages/allnews.dart';
import 'package:day4_30doc/util/objects.dart';
import 'package:flutter/material.dart';
import 'package:day4_30doc/pages/category_view.dart';
import 'package:day4_30doc/pages/category_grid.dart';

void main() => runApp(NewsApp());

class NewsApp extends StatefulWidget {
  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'All News',
      routes: {
        'Category View': (context) => CategoryView(newsCategories[0]),
        'Category Grid': (context) => CategoryGrid(),
        'All News':(context)=> AllNews(),
      },
    );
  }
}

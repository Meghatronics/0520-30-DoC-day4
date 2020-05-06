import 'dart:convert';

import 'package:day4_30doc/util/components.dart';
import 'package:day4_30doc/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsCategory {
  NewsCategory(this.categoryName, {this.categoryIcon}) {
    categoryParameter = categoryName.toLowerCase();
  }
  final String categoryName;
  IconData categoryIcon;
  String categoryParameter;
}

class News {
  News(
      {this.source, this.author, this.title, this.imageLink, this.publishDate});
  String source;
  String author;
  String title;
  String imageLink;
  String publishDate;
}

List<NewsCategory> newsCategories = [
  NewsCategory(
    'Business',
    categoryIcon: Icons.business_center,
  ),
  NewsCategory(
    'Entertainment',
    categoryIcon: Icons.live_tv,
  ),
  NewsCategory(
    'General',
    categoryIcon: Icons.donut_large,
  ),
  NewsCategory(
    'Health',
    categoryIcon: Icons.healing,
  ),
  NewsCategory(
    'Science',
    categoryIcon: Icons.pool,
  ),
  NewsCategory(
    'Sports',
    categoryIcon: Icons.videogame_asset,

  ),
  NewsCategory(
    'Technology',
    categoryIcon: Icons.memory,
  ),
];

class FeedManager {
  static bool isLoading = true;
  static List<News> _compiledNewsList = [];

  static Future<void> getNews({NewsCategory category}) async {
    http.Response response;
    var decodedResponse;
    _compiledNewsList.clear();
    if (category != null)
      response = await http
          .get('$kApiCall&category=${category.categoryParameter}$kApiKey');
    else
      response = await http.get('$kApiCall$kApiKey');

    if (response.statusCode == 200) {
      decodedResponse = jsonDecode(response.body)['articles'];

      int count = decodedResponse.length;

      for (int i = 0; i < count; i++) {
        String source = decodedResponse[i]['source']['name'];
        String author = decodedResponse[i]['author'];
        String title = decodedResponse[i]['title'];
        String imageLink = decodedResponse[i]['urlToImage'];
        String date = decodedResponse[i]['publishedAt'];
        String publishDate = date.substring(0, 10);
        //       '${date.day} - ${date.month} - ${date.year}, ${date.hour}:${date.minute}';
        _compiledNewsList.add(News(
          source: source,
          author: author,
          title: title,
          imageLink: imageLink,
          publishDate: publishDate,
        ));
      }

      isLoading = false;
    } else {
      isLoading = false;
    }
  }

  static List<Widget> newsFeed() {
    List<Widget> _newsCards = [];
    for (int i = 0; i < _compiledNewsList.length; i++) {
      if (_compiledNewsList[i].imageLink != null)
        _newsCards.add(NewsScrollCardImage(_compiledNewsList[i]));
      else
        _newsCards.add(NewsScrollCard(_compiledNewsList[i]));
    }
    return _newsCards;
  }
}

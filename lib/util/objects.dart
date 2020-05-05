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
    categoryIcon: Icons.music_note,
  ),
  NewsCategory(
    'General',
    categoryIcon: Icons.supervisor_account,
  ),
  NewsCategory(
    'Health',
    categoryIcon: Icons.business_center,
  ),
  NewsCategory(
    'Science',
    categoryIcon: Icons.healing,
  ),
  NewsCategory(
    'Sports',
  ),
  NewsCategory(
    'Technology',
    categoryIcon: Icons.settings_applications,
  ),
];

class FeedManager {
  static bool isLoading = true;
  static List<News> _compiledNewsList = [];

  static Future<void> getNews({NewsCategory category}) async {
    http.Response response;
    var decodedResponse;
    if (category != null)
      response = await http
          .get('$kApiCall&category=${category.categoryParameter}$kApiKey');
    else
      response = await http.get('$kApiCall$kApiKey');

    if (response.statusCode == 200) {
      decodedResponse = jsonDecode(response.body);

      int count = decodedResponse['totalResults'];

      for (int i = 0; i < 20; i++) {
        String source = decodedResponse['articles'][i]['source']['name'];
        String author = decodedResponse['articles'][i]['author'];
        String title = decodedResponse['articles'][i]['title'];
        String imageLink = decodedResponse['articles'][i]['urlToImage'];
        String date = decodedResponse['articles'][i]['publishedAt'];
        //String publishDate =
        //       '${date.day} - ${date.month} - ${date.year}, ${date.hour}:${date.minute}';
        _compiledNewsList.add(News(
          source: source,
          author: author,
          title: title,
          imageLink: imageLink,
          publishDate: date,
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
      _newsCards.add(NewsScrollCard(_compiledNewsList[i]));
    }
    return _newsCards;
  }
}

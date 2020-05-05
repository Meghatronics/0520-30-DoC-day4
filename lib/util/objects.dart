import 'package:flutter/material.dart';

class NewsCategory {
  NewsCategory(this.categoryName, {this.categoryIcon}) {
    categoryParameter = categoryName.toLowerCase();
  }
  final String categoryName;
  IconData categoryIcon;
  String categoryParameter;
}

class News{
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

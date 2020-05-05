import 'package:flutter/material.dart';

class NewsCategory {
  NewsCategory(this.categoryName, {this.categoryIcon});

  String categoryName;
  IconData categoryIcon;
}

List<NewsCategory> newsCategories = [
  NewsCategory(
    'Sports',
    categoryIcon: Icons.bubble_chart,
  ),
  NewsCategory(
    'Business',
    categoryIcon: Icons.business_center,
  ),
  NewsCategory(
    'Entertainment',
    categoryIcon: Icons.music_note,
  ),
  NewsCategory(
    'Politics',
    categoryIcon: Icons.supervisor_account,
  ),
  NewsCategory(
    'Business',
    categoryIcon: Icons.business_center,
  ),
  NewsCategory(
    'Medicine',
    categoryIcon: Icons.healing,
  ),
  NewsCategory(
    'Technology',
    categoryIcon: Icons.settings_applications,
  ),
 
];
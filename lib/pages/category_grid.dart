import 'package:day4_30doc/util/objects.dart';
import 'package:flutter/material.dart';
import 'package:day4_30doc/util/constants.dart';
import 'package:day4_30doc/util/components.dart';

class CategoryGrid extends StatelessWidget {
  List<CategoryGridItem> _categoriesList = [];
  @override
  Widget build(BuildContext context) {
    _categoriesList.clear();
    for (int i = 0; i < newsCategories.length - 1; i++) {
      _categoriesList.add(CategoryGridItem(newsCategories[i]));
    }

    return Scaffold(
      body: Container(
          child: Column(children: <Widget>[
        Expanded(
          flex: 3,
          child: Container(
              alignment: Alignment.lerp(Alignment.center, Alignment.bottomCenter, 0.5),
              width: double.infinity,
              color: Colors.white,
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                children: _categoriesList,
              ),
            ),
        ),
        Expanded(
          child: Container(
              width: double.infinity,
              alignment:
                  Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: kThemeColor1,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'CATEGORIES',
                    style: kHeadingTextStyle.copyWith(fontSize: 30),
                  ),
                  OutlineButton.icon(focusColor: kThemeColor2 ,onPressed: (){}, icon: Icon(Icons.view_headline, size: 20, color: Colors.white70,) , label: Text('All', style: TextStyle(color: Colors.white70),),)
                ],
              ),
            ),
        )
      ])),
    );
  }
}

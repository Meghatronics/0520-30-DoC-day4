import 'package:flutter/material.dart';
import 'package:day4_30doc/util/constants.dart';
import 'package:day4_30doc/util/components.dart';

class CategoryView extends StatelessWidget {
  const CategoryView(this.currentCategory);
final String currentCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffeeeeee),
        child: Stack(
          fit: StackFit.expand,
          overflow: Overflow.visible,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: kBrowseHeaderHeight,
              child: Container(
                alignment:
                    Alignment.lerp(Alignment.topCenter, Alignment.center, 0.6),
                padding: EdgeInsets.only(top: 20),
                color: kThemeColor1,
                child: Text(currentCategory.toUpperCase(), style: kHeadingTextStyle),
              ),
            ),
            Positioned(
              top: 50,
              left: 10,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'All News');
                },
                backgroundColor: kThemeColor1,
                child: Icon(Icons.home, color: Colors.white),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              width: 40,
              height: kBrowseHeaderHeight,
              child: RawMaterialButton(
                highlightColor: kThemeColor1,
                child: Container(
                  alignment: Alignment.lerp(
                      Alignment.topCenter, Alignment.center, 0.7),
                  color: Colors.white,
                  child: Icon(
                    Icons.apps,
                    color: kThemeColor1,
                    size: 30,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'Category Grid');
                },
              ),
            ),
            Positioned(
              top: 130,
              left: 60,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: kGreyIconColor,
                      spreadRadius: -2,
                      blurRadius: 10,
                      offset: Offset(0, -3),
                    )
                  ],
                ),
                height: 700,
                child: ListView(
                  children: newsCards,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              width: 57,
              top: 130,
              child: CategoryBar(),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:day4_30doc/pages/category_view.dart';
import 'package:day4_30doc/util/objects.dart';
import 'package:flutter/material.dart';
import 'package:day4_30doc/util/constants.dart';

class NewsScrollCard extends StatelessWidget {
  NewsScrollCard(this.newsToShow);
  final News newsToShow;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.tightForFinite(height: kNewsScrollCardHeight),
      color: kNewsScrollCardColor,
      padding: kNewsScrollCardPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            fit: FlexFit.loose,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                CircleAvatar(
                  radius: 15,
                  backgroundColor: kThemeColor3,
                ),
                SizedBox(width: 5),
                Expanded(
                    child: Text(newsToShow.source?? 'Unspecified',
                        style: kNewsScrollCardReporterStyle)),
                Icon(
                  Icons.share,
                  color: kGreyIconColor,
                  size: kNewsScrollCardIconSize,
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.bookmark_border,
                  color: kGreyIconColor,
                  size: kNewsScrollCardIconSize,
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Expanded(
              flex: 3,
              child: Text(newsToShow.title,
                  maxLines: kNewsScrollCardHeadlineMaxLines,
                  overflow: kNewsScrollCardHeadlineOverflow,
                  style: kNewsScrollCardHeadlineStyle)),
          Flexible(
            fit: FlexFit.loose,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Text(newsToShow.publishDate,
                        style: kNewsScrollCardDateStyle)),
                IconCounter(
                  icon: Icons.view_headline,
                  count: 17,
                ),
                IconCounter(
                  icon: Icons.remove_red_eye,
                  count: 2090,
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}

class NewsScrollCardImage extends StatelessWidget {
  NewsScrollCardImage(this.newsToShow);

  final News newsToShow;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: kNewsScrollCardPadding.left),
      child: Row(
        children: <Widget>[
          Flexible(
            child: Container(
              margin: kNewsScrollCardImageMargin,
              width: 100,
              height: kNewsScrollCardHeight - 50,
              decoration: BoxDecoration(
                color: kThemeColor2,
                //TODO Add box shadow to box
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('${newsToShow.imageLink}'),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: NewsScrollCard(newsToShow),
          )
        ],
      ),
    );
  }
}

class IconCounter extends StatelessWidget {
  IconCounter({@required this.icon, @required this.count});

  final IconData icon;
  final int count;
//TODO Format icon and text
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size: 17,
            color: kGreyIconColor,
          ),
          SizedBox(
            width: 2,
          ),
          Text(
            count.toString(),
            style: TextStyle(color: kGreyIconColor, fontSize: 14),
          )
        ],
      ),
    );
  }
}

//<Category Bar
class CategoryBar extends StatefulWidget {
  @override
  _CategoryBarState createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  List<Widget> _categoriesList = [];
  @override
  Widget build(BuildContext context) {
    _categoriesList.clear();
    for (int i = 0; i < newsCategories.length - 1; i++) {
      _categoriesList.add(Expanded(child: CategoryBarItem(newsCategories[i])));
    }

    return Container(
      child: Column(
        children: _categoriesList,
      ),
    );
  }
}
//Category Bar>

class CategoryBarItem extends StatelessWidget {
  CategoryBarItem(this.newsCategory, {this.current}) {
    if (current == null)
      selected = false;
    else
      selected = current;
  }

  final NewsCategory newsCategory;

  bool selected;
  final bool current;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            newsCategory.categoryIcon,
            size: 28,
            color: selected ? kThemeColor1 : kGreyIconColor,
          ),
        ],
      ),
    );
  }
}

class CategoryGridItem extends StatelessWidget {
  CategoryGridItem(this.category);
  final NewsCategory category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryView(category.categoryName)));
      },
      child: Container(
        constraints: BoxConstraints.tightForFinite(width: 100, height: 100),
        decoration: BoxDecoration(
            color: Colors.white, border: Border.all(color: Color(0xFFDDDDDD))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              category.categoryIcon,
              size: 35,
              color: kBlackGrey,
            ),
            Text(
              category.categoryName,
              style: TextStyle(
                color: kBlackGrey,
                fontWeight: FontWeight.w300,
                fontSize: 17,
              ),
            )
          ],
        ),
      ),
    );
  }
}

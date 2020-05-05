import 'package:day4_30doc/util/objects.dart';
import 'package:flutter/material.dart';
import 'package:day4_30doc/util/constants.dart';

List<Widget> newsCards = [
  NewsScrollCard(),
  NewsScrollCardImage(),
  NewsScrollCard(),
  NewsScrollCardImage(),
  NewsScrollCard(),
  NewsScrollCard(),
  NewsScrollCard(),
  NewsScrollCard(),
  NewsScrollCard(),
  NewsScrollCard(),
  NewsScrollCard(),
  NewsScrollCard(),
];

class NewsScrollCard extends StatelessWidget {
//TODO Add Constructor to take News Object

//TODO Create properties and fill them in build
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
                    child: Text('Lorem ipsum dolor sit amet',
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
              child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper malesuada proin libero nunc consequat interdum. A pellentesque sit amet porttitor eget. Massa vitae tortor condimentum lacinia quis vel eros donec. Eget nunc lobortis mattis aliquam faucibus purus in massa tempor.',
                  maxLines: kNewsScrollCardHeadlineMaxLines,
                  overflow: kNewsScrollCardHeadlineOverflow,
                  style: kNewsScrollCardHeadlineStyle)),
          Flexible(
            fit: FlexFit.loose,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Text('19.03.2019', style: kNewsScrollCardDateStyle)),
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
                  image: NetworkImage(
                      'https://i.picsum.photos/id/340/200/300.jpg'),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: NewsScrollCard(),
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
_categoriesList[3] = Expanded(child: CategoryBarItem(newsCategories[3], current: true,));

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Divider(
        //   height: 40,
        //   color: selected ? kThemeColor1 : kGreyIconColor,
        // ),
        Icon(
          newsCategory.categoryIcon,
          size: 28,
          color: selected ? kThemeColor1 : kGreyIconColor,
        ),
        // Divider(
        //   height: 40,
        //   color: selected ? kThemeColor1 : kGreyIconColor,
        // )
      ],
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
        Navigator.pushNamed(context, 'Category View');
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

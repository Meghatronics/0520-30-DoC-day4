import 'package:day4_30doc/util/objects.dart';
import 'package:flutter/material.dart';
import 'package:day4_30doc/util/constants.dart';
import 'package:day4_30doc/util/components.dart';

class AllNews extends StatelessWidget {
  void load() async {
    FeedManager.isLoading = true;
    var newsList = await FeedManager.getNews();
    

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FeedManager.isLoading
          ? Container(color: Colors.redAccent, width: 200, height: 200)
          : Container(
              color: Color(0xffeeeeee),
              child: Stack(
                  fit: StackFit.expand,
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Positioned(
                      top: 220,
                      left: 0,
                      right: 0,
                      bottom: 400,
                      child: Container(
                        alignment: Alignment.centerRight,
                        //      padding: EdgeInsets.only(top: 20),
                        color: kThemeColor1,
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: OutlineButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'Category Grid');
                            },
                            child: Text(
                              'CATEGORIES',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 19,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      height: kBrowseHeaderHeight,
                      child: Container(
                        alignment: Alignment.lerp(
                            Alignment.topCenter, Alignment.center, 0.4),
                        padding: EdgeInsets.only(top: 20),
                        color: kThemeColor1,
                        child: Text('NEWS', style: kHeadingTextStyle),
                      ),
                    ),
                    Positioned(
                      top: 100,
                      left: 0,
                      right: 40,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
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
                        child: ListView(
                          children: newsCards,
                        ),
                      ),
                    ),
                  ]),
            ),
    );
  }
}

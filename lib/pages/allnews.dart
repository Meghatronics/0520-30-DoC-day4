import 'package:flutter/material.dart';
import 'package:day4_30doc/util/constants.dart';
import 'package:day4_30doc/util/components.dart';


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
              top: 50,
              left: 0,
              right: 0,
              height: kBrowseHeaderHeight,
              child: Container(
                  alignment:
                      Alignment.lerp(Alignment.topCenter, Alignment.center, 0.6),
                  padding: EdgeInsets.only(top: 20),
                  color: kThemeColor1,
                  child: Text('NEWS', style: kHeadingTextStyle),
                ),
            ),
         
            Positioned(
              top: 130,
              left: 0,
              right: 60,
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
            Positioned(
              bottom: 0,
              right: 0,
              width: 57,
              top: 130,
              child: Container(
                Column(
                  children: <Widget>[
                    Expanded(RotatedBox(OutlineButton()))
                  ]
                )
              ),
            )
          ],
        ),
      ),
    );
  }
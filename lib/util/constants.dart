import 'package:flutter/material.dart';
//API DETAILS
String kApiKey = '&apiKey=53bd8f74b6194223ab315e288dca3037';
String kApiCall ='https://newsapi.org/v2/top-headlines?country=ng&pageSize=40';

//
const double kBrowseHeaderHeight = 200;
const double kNewsScrollCardHeight = 160;
const double kNewsScrollCardIconSize = 14;
const int kNewsScrollCardHeadlineMaxLines = 3;
const TextOverflow kNewsScrollCardHeadlineOverflow = TextOverflow.ellipsis;

//Colors
const Color kThemeColor1 = Color(0xFF342B5B);
const Color kThemeColor2 = Color(0x60464085);
const Color kThemeColor3 = Color(0x99040220);
const Color kBlackGrey = Color(0xFF777777);
const Color kGreyIconColor = Color(0xff999999);
const Color kNewsScrollCardColor = Colors.transparent;
const Color kNewsScrollCardHeadlineColor = Colors.black87;


//TextStyles
const TextStyle kNewsScrollCardHeadlineStyle = TextStyle(
  fontSize: 18,
  color: kNewsScrollCardHeadlineColor,
  fontWeight: FontWeight.w700,
);

const TextStyle kNewsScrollCardDateStyle = TextStyle(
  fontSize: 14,
  color: kGreyIconColor,
);

const TextStyle kNewsScrollCardReporterStyle = TextStyle(
  fontSize: 14,
  color: kGreyIconColor,
);

const TextStyle kHeadingTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 24,
  fontWeight: FontWeight.w600,
);

//Padding and Margins
const kNewsScrollCardPadding =
    EdgeInsets.only(top: 20, bottom: 0, left: 15, right: 15);

const kNewsScrollCardImageMargin =
    EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0);




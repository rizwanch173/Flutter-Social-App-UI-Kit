import 'package:floein_social_app/Screens/DisCover/DiscoverScreen.dart';
import 'package:floein_social_app/Screens/Home/HomeScreen.dart';
import 'package:floein_social_app/Screens/Inbox/InboxScreen.dart';
import 'package:floein_social_app/Screens/profile/ProfileScreen.dart';
import 'package:flutter/material.dart';


final Map<String, WidgetBuilder> routes = {
  //SplashPage.routeName: (context) => SplashPage(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  InboxScreen.routeName: (context) => InboxScreen(),
  Discover.routeName: (context) => Discover(),
};

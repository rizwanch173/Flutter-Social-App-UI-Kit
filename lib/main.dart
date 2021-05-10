import 'package:floein_social_app/NavigationRoutes.dart';
import 'package:floein_social_app/Screens/Home/HomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final MaterialColor colorCustom = MaterialColor(0xff651CE5, color);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Social App Ui Kit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        fontFamily: "Sans serif",
        primarySwatch: colorCustom,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}

Map<int, Color> color = {
  50: Color.fromRGBO(102, 28, 229, .1),
  100: Color.fromRGBO(102, 28, 229, .2),
  200: Color.fromRGBO(102, 28, 229, .3),
  300: Color.fromRGBO(102, 28, 229, .4),
  400: Color.fromRGBO(102, 28, 229, .5),
  500: Color.fromRGBO(102, 28, 229, .6),
  600: Color.fromRGBO(102, 28, 229, .7),
  700: Color.fromRGBO(102, 28, 229, .8),
  800: Color.fromRGBO(102, 28, 229, .9),
  900: Color.fromRGBO(102, 28, 229, 1),
};

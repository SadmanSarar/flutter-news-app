import 'package:flutter/material.dart';
import 'package:news_app_flutter/view/Routes.dart';
import 'package:news_app_flutter/view/page/HomePage.dart';
import 'package:news_app_flutter/view/page/LoginPage.dart';
import 'package:news_app_flutter/view/page/SplashScreenPage.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: Colors.red,
        backgroundColor: Colors.amber,
      ),
      home: SplashScreenPage(),
      showPerformanceOverlay: false,
      routes: {
        ROUTE_PATH[Routes.LOGIN]: (buildContext) => LoginPage(),
        ROUTE_PATH[Routes.HOME]: (buildContext) => HomePage(),
      },
    );
  }
}

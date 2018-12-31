import 'package:flutter/material.dart';
import 'package:flutter_stetho/flutter_stetho.dart';

import 'view/page/SplashScreenPage.dart';

void main() {
  Stetho.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: Colors.red,
        backgroundColor: Colors.amber,
      ),
      // home: HomePage(title: 'Flutter Demo Home Page'),
      home: SplashScreenPage(),
      showPerformanceOverlay: false,
    );
  }
}

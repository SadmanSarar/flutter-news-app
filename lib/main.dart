import 'package:flutter/material.dart';
import 'package:flutter_stetho/flutter_stetho.dart';

import 'view/page/SplashScreenPage.dart';


void main() {
  Stetho.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
    );
  }

  
}
